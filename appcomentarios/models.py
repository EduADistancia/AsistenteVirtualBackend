from django.db import models
from django.utils import timezone


class Comment(models.Model):
    date_comment = models.DateTimeField("Fecha", default=timezone.now)
    comment = models.TextField("Comentario")
    user_moodle = models.CharField("Creado por", max_length=50, null=True, default="Anónimo")
    
    class Meta:
        verbose_name = "Comentario"
        verbose_name_plural = "Comentarios"