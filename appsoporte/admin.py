from django.contrib import admin

from django.contrib import admin
from .models import RolCostumer, Costumer, Question, Response


class ResponseInline(admin.StackedInline):
    model = Response
    extra = 0
    can_delete = False
    readonly_fields = ("answered_by", "created_at")

    # sobreescribimos el guardado del inline
    def save_model(self, request, obj, form, change):
        if not obj.answered_by:
            obj.answered_by = request.user
        super().save_model(request, obj, form, change)

@admin.register(RolCostumer)
class RolCostumerAdmin(admin.ModelAdmin):
    list_display = ("rol",)
    search_fields = ("rol",)


@admin.register(Costumer)
class CostumerAdmin(admin.ModelAdmin):
    list_display = ("idMoodle", "email", "rol")
    search_fields = ("idMoodle", "email")
    list_filter = ("rol",)


class ResponseInline(admin.StackedInline):
    model = Response
    extra = 0
    can_delete = False


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ("id", "customer", "short_text", "status", "created_at", "get_email")
    list_filter = ("status", "created_at")
    search_fields = ("text", "customer__idMoodle", "customer__email")
    inlines = [ResponseInline]

    def short_text(self, obj):
        return (obj.text[:50] + "...") if len(obj.text) > 50 else obj.text
    short_text.short_description = "Consulta"

    def get_email(self, obj):
        return obj.override_email or obj.customer.email
    get_email.short_description = "Correo destino"


@admin.register(Response)
class ResponseAdmin(admin.ModelAdmin):
    list_display = ("id", "question", "short_text", "sent_ok", "created_at", "answered_by")
    list_filter = ("sent_ok", "created_at")
    search_fields = ("text", "question__customer__email")

    def short_text(self, obj):
        return (obj.text[:50] + "...") if len(obj.text) > 50 else obj.text
    short_text.short_description = "Respuesta"

    def save_model(self, request, obj, form, change):
        if not obj.answered_by:
            obj.answered_by = request.user
        super().save_model(request, obj, form, change)

        # lanzar tarea Celery para enviar email
        from .tasks import send_response_email
        send_response_email.delay(obj.id)