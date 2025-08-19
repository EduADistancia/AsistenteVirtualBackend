from django.db import models

class SupportEmailConfig(models.Model):
    host = models.CharField("Host", max_length=255, default="smtp.gmail.com")
    port = models.IntegerField("Puerto", default=587)
    use_tls = models.BooleanField("TLS", default=True)
    email = models.EmailField("Correo de envío")
    password = models.CharField("Password", max_length=128)
    from_email = models.CharField("Remitente", max_length=100)
    active = models.BooleanField(default=True)

    class Meta:
        verbose_name = "Configuración de Correo"
        verbose_name_plural = "Configuraciones de Correo"

    def __str__(self):
        return f"{self.from_email} <{self.email}>"

class AllowedOriginCORS(models.Model):
    origin = models.URLField("Origen permitido")
    active = models.BooleanField(default=True)

    class Meta:
        verbose_name = "Configuración CORS"
        verbose_name_plural = "Configuraciones CORS"

    def __str__(self):
        return self.origin