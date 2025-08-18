from django.contrib import admin

from django.contrib import admin
from .models import RolCostumer, Costumer, Question, Response


class ResponseInline(admin.StackedInline):
    model = Response
    extra = 0
    can_delete = False
    readonly_fields = ("answered_by", "created_at")

    def save_model(self, request, obj, form, change):
        if not obj.answered_by:
            obj.answered_by = request.user
        super().save_model(request, obj, form, change)
        
        # AÚN NO FUNCIONA!!!!!!!!!!!!!!!!!!1
        from .tasks import send_response_email
        send_response_email.delay(obj.id)

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

    def short_text(self, obj):
        return (obj.text[:50] + "...") if len(obj.text) > 50 else obj.text
    
    short_text.short_description = "Consulta"

    def get_email(self, obj):
        return obj.override_email or obj.customer.email
    
    get_email.short_description = "Correo destino"