from django.contrib import admin
from .models import SupportEmailConfig, AllowedOriginCORS

@admin.register(SupportEmailConfig)
class SupportEmailConfigAdmin(admin.ModelAdmin):
    list_display = ("email", "from_email", "active")
    list_editable = ("active",)

@admin.register(AllowedOriginCORS)
class AllowedOriginCORSAdmin(admin.ModelAdmin):
    list_display = ("origin", "active")
    list_editable = ("active",)
