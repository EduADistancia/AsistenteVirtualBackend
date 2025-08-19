from django.apps import AppConfig


class AppconfigConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'appconfig'
    verbose_name = '5-Configuraciones'

    def ready(self):
        import appconfig.signals