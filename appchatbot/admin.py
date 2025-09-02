from django.contrib import admin
from .models import ConsultaChatbot

@admin.register(ConsultaChatbot)
class ConsultaChatbotAdmin(admin.ModelAdmin):
    list_display = ('timestamp', 'user_input', 'predicted_tag', 'confidence', 'user_id')
    search_fields = ('user_input', 'predicted_tag', 'related_tags')
    list_filter = ('predicted_tag',)
