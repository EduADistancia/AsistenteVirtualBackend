from django.apps import apps
from django.core.signals import request_started
from django.conf import settings

from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import SupportEmailConfig

def load_cors_allowed_origins(sender, **kwargs):
    AllowedOriginCORS = apps.get_model('appconfig', 'AllowedOriginCORS')
    settings.CORS_ALLOWED_ORIGINS = list(AllowedOriginCORS.objects.values_list('origin', flat=True))

# Conectar la señal para cargar CORS_ALLOWED_ORIGINS en cada solicitud
request_started.connect(load_cors_allowed_origins)


@receiver(post_save, sender=SupportEmailConfig)
def update_email_settings(sender, instance, **kwargs):
    settings.EMAIL_HOST = instance.host
    settings.EMAIL_PORT = instance.port
    settings.EMAIL_USE_TLS = instance.use_tls
    settings.EMAIL_HOST_USER = instance.email
    settings.EMAIL_HOST_PASSWORD = instance.password
    settings.DEFAULT_FROM_EMAIL = instance.from_email