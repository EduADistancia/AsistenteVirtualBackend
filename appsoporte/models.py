from django.db import models
from django.conf import settings


class RolCostumer(models.Model):
    rol = models.CharField('Rol en Moodle', max_length=30, unique=True)
    
    class Meta:
        verbose_name_plural = "Roles en Moodle"
        
    def __str__(self):
        return self.rol

class Costumer(models.Model):
    idMoodle = models.CharField("Documento", max_length=12)
    email = models.EmailField("Correo", max_length=254)
    rol = models.ForeignKey(RolCostumer, on_delete=models.CASCADE)
    
    class Meta:
        verbose_name = "Usuario Moodle"
        verbose_name_plural = "Usuarios Moodle"

class Question(models.Model):
    customer = models.ForeignKey(Costumer, on_delete=models.CASCADE, related_name="questions")
    text = models.TextField("Consulta / Requerimiento")
    created_at = models.DateTimeField(auto_now_add=True)
    
    # correo alternativo si lo define desde el front
    override_email = models.EmailField("Correo alternativo", max_length=254, blank=True, null=True)
    STATUS_CHOICES = [
        ('pending', 'Pendiente'),
        ('answered', 'Respondida'),
        ('closed', 'Cerrada'),
    ]
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='pending')

    class Meta:
        verbose_name = "Consulta"
        verbose_name_plural = "Consultas"

    def __str__(self):
        return f"Consulta #{self.id} de {self.customer}"

class Response(models.Model):
    question = models.OneToOneField(Question, on_delete=models.CASCADE, related_name="response")
    text = models.TextField("Respuesta")
    created_at = models.DateTimeField(auto_now_add=True)
    sent_ok = models.BooleanField("Envío exitoso", default=False)
    error_log = models.TextField("Error de envío", blank=True, null=True)
    answered_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name="Respondido por",
        related_name="responses"
    )

    class Meta:
        verbose_name = "Respuesta"
        verbose_name_plural = "Respuestas"

    def __str__(self):
        return f"Respuesta a consulta #{self.question.id}"