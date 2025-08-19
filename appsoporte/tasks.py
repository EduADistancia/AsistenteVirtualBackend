import os

from celery import shared_task
from django.core.mail import EmailMultiAlternatives
from django.core.mail.backends.smtp import EmailBackend
from django.template.loader import render_to_string
from django.conf import settings
from django.utils import timezone
from email.mime.image import MIMEImage

from appconfig.models import SupportEmailConfig
from .models import Response


def get_support_email():
    config = SupportEmailConfig.objects.filter(active=True).first()
    
    return {
        "host": config.host,
        "port": config.port,
        "use_tls": config.use_tls,
        "email": config.email,
        "password": config.password,
        "from_email": f"{config.from_email} <{config.email}>",
    }

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

        smtp_config = get_support_email()
        
        email = EmailMultiAlternatives(
            subject=f"Respuesta a tu consulta",
            body=text_content,
            from_email=smtp_config["from_email"],
            to=[recipient],
        )
        email.attach_alternative(html_content, "text/html")
        
        image_path = os.path.join(settings.BASE_DIR, "static/img/FirmaBA.jpg")
        with open(image_path, "rb") as f:
            img = MIMEImage(f.read())
            img.add_header('Content-ID', '<signature_image>')
            img.add_header('Content-Disposition', 'inline', filename="FirmaBA.jpg")
            email.attach(img)
        
        email.connection = EmailBackend(
            host=smtp_config["host"],
            port=smtp_config["port"],
            username=smtp_config["email"],
            password=smtp_config["password"],
            use_tls=smtp_config["use_tls"],
            fail_silently=False,
        )
        
        email.send()

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
