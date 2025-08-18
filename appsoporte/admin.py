from django.contrib import admin
from .models import RolCostumer, Costumer, Question, Response
from .tasks import send_response_email


class ResponseInline(admin.StackedInline):
    model = Response
    extra = 0
    can_delete = False
    readonly_fields = ("answered_by", "created_at", "error_log", "sent_ok")

    # def save_model(self, request, obj, form, change):
    #     if not obj.answered_by:
    #         obj.answered_by = request.user
    #     super().save_model(request, obj, form, change)
    #     send_response_email.delay(obj.id)


@admin.register(RolCostumer)
class RolCostumerAdmin(admin.ModelAdmin):
    list_display = ("rol",)
    search_fields = ("rol",)


@admin.register(Costumer)
class CostumerAdmin(admin.ModelAdmin):
    list_display = ("idMoodle", "email", "rol")
    search_fields = ("idMoodle", "email")
    list_filter = ("rol",)


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
                send_response_email.delay(obj.id)
                
                # Actualizar el status de la pregunta asociada
                question = obj.question
                question.status = "answered"  # Ajustá al valor que corresponda
                question.save(update_fields=["status"])
        formset.save_m2m()