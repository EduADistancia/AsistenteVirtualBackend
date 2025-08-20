import csv

from django.contrib import admin, messages
from django.shortcuts import render, redirect
from django.urls import path

from .models import RolCostumer, Costumer, Question, Response
from .tasks import send_response_email
from .forms import CsvImportForm


class ResponseInline(admin.StackedInline):
    model = Response
    extra = 0
    can_delete = False
    readonly_fields = ("answered_by", "created_at", "error_log", "sent_ok")


@admin.register(RolCostumer)
class RolCostumerAdmin(admin.ModelAdmin):
    list_display = ("rol",)
    search_fields = ("rol",)


@admin.register(Costumer)
class CostumerAdmin(admin.ModelAdmin):
    list_display = ("idMoodle", "email", "rol")
    search_fields = ("idMoodle", "email")
    list_filter = ("rol",)

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path("import-csv/", self.admin_site.admin_view(self.import_csv), name="costumer_import_csv"),
        ]
        return custom_urls + urls
        
    def import_csv(self, request):
        if request.method == "POST":
            form = CsvImportForm(request.POST, request.FILES)
            if form.is_valid():
                csv_file = form.cleaned_data["csv_file"]
                decoded_file = csv_file.read().decode("utf-8").splitlines()
                reader = csv.DictReader(decoded_file)

                count = 0
                for row in reader:
                    try:
                        rol_obj, _ = RolCostumer.objects.get_or_create(rol=row["rol"])
                        Costumer.objects.update_or_create(
                            idMoodle=row["idMoodle"],
                            defaults={
                                "email": row["email"],
                                "rol": rol_obj
                            }
                        )
                        count += 1
                    except Exception as e:
                        messages.error(request, f"Error en la fila {row}: {e}")
                        continue

                self.message_user(request, f"✅ Se importaron {count} usuarios correctamente.", level=messages.SUCCESS)
                return redirect("..")
        else:
            form = CsvImportForm()

        return render(request, "admin/csv_form.html", {"form": form, "title": "Importar Usuarios Moodle desde CSV"})


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ("short_text", "status", "created_at", "customer")
    list_filter = ("status", "created_at")
    search_fields = ("text", "customer__idMoodle", "customer__email")
    inlines = [ResponseInline]

    def get_readonly_fields(self, request, obj=None):
        return [f.name for f in self.model._meta.fields]

    # Mostrar solo texto corto
    def short_text(self, obj):
        return (obj.text[:50] + "...") if len(obj.text) > 50 else obj.text
    short_text.short_description = "Consulta"
    
    # Sobrescribir save_formset para ejecutar la tarea Celery al guardar respuestas
    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for obj in instances:
            if isinstance(obj, Response):
                if not obj.answered_by:
                    obj.answered_by = request.user
                obj.save()
                # Ejecutar Celery para enviar correo
                # send_response_email.delay(obj.id)
                # PAW No soporta Celery y Redis
                send_response_email(obj.id)
                
                # Actualizar el status de la pregunta asociada
                question = obj.question
                question.status = "answered"
                question.save(update_fields=["status"])
        formset.save_m2m()