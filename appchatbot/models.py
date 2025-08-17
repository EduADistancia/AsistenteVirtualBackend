from django.db import models
from appsoporte.models import Costumer

class ConsultaChatbot(models.Model):
    timestamp = models.DateTimeField("Fecha", auto_now_add=True)
    user_input = models.TextField("Consulta")
    user_id = models.ForeignKey(
        Costumer,
        on_delete=models.CASCADE, 
        verbose_name="Usuario Moodle",
        related_name="consultas"
    )
    predicted_tag = models.CharField("Predicción", max_length=100)
    confidence = models.FloatField("Confianza")
    related_tags = models.TextField("Relacionados", help_text="Lista separada por comas")

    def __str__(self):
        return f"[{self.timestamp}] {self.predicted_tag} ({self.confidence:.2f})"
    
    class Meta:
        verbose_name = "Consulta realizada"    
        verbose_name_plural = "Consultas chatbot"    