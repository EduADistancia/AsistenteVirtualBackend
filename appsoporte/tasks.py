import os

from celery import shared_task
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.conf import settings
from django.utils import timezone
from email.mime.image import MIMEImage

from .models import Response

@shared_task(bind=True, max_retries=3)
def send_response_email(self, response_id):
    try:
        response = Response.objects.select_related("question__customer").get(id=response_id)
        created_at_local = timezone.localtime(response.question.created_at)
        recipient = response.question.override_email or response.question.customer.email

        # Renderizar template HTML
        html_content = render_to_string(
            "emails/response_email.html",
            {
                "created_at": created_at_local.strftime("%d/%m/%Y %H:%M"),
                "textQuestion": response.question.text,
                "textResponse": response.text,
            }
        )
        # Texto plano por si el cliente de correo no soporta HTML
        text_content = (
            f"Hola,\n"
            f"A tu consulta del {created_at_local.strftime('%d/%m/%Y %H:%M')}:\n"
            f"{response.question.text}\n\n"
            f"Respondemos:\n"
            f"{response.text}\n\n"
            f"Atentamente, el equipo de Educación a Distancia - AHPF - ME."
        ) 

        email = EmailMultiAlternatives(
            subject=f"Respuesta a tu consulta",
            body=text_content,
            from_email=settings.DEFAULT_FROM_EMAIL,
            to=[recipient],
        )
        email.attach_alternative(html_content, "text/html")
        
        image_path = os.path.join(settings.BASE_DIR, "static/img/FirmaBA.jpg")
        with open(image_path, "rb") as f:
            img = MIMEImage(f.read())
            img.add_header('Content-ID', '<signature_image>')
            img.add_header('Content-Disposition', 'inline', filename="FirmaBA.jpg")
            email.attach(img)
        
        email.send(fail_silently=False)

        response.sent_ok = True
        response.error_log = None
        response.save(update_fields=["sent_ok", "error_log"])
        return f"Correo enviado a {recipient}"

    except Exception as exc:
        try:
            response = Response.objects.get(id=response_id)
            response.sent_ok = False
            response.error_log = str(exc)
            response.save(update_fields=["sent_ok", "error_log"])
        except:
            pass
        raise self.retry(exc=exc, countdown=60)
