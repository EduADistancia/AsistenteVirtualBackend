from celery import shared_task
from django.core.mail import send_mail
from django.conf import settings
from .models import Response


@shared_task(bind=True, max_retries=3)
def send_response_email(self, response_id):
    try:
        response = Response.objects.select_related("question__customer").get(id=response_id)

        # Determinar correo destino
        recipient = response.question.override_email or response.question.customer.email

        send_mail(
            subject=f"Respuesta a tu consulta #{response.question.id}",
            message=response.text,
            from_email=settings.DEFAULT_FROM_EMAIL,
            recipient_list=[recipient],
            fail_silently=False,
        )

        # Marcar como enviado
        response.sent_ok = True
        response.error_log = None
        response.save(update_fields=["sent_ok", "error_log"])

        return f"Correo enviado a {recipient}"

    except Exception as exc:
        # Guardar error
        try:
            response = Response.objects.get(id=response_id)
            response.sent_ok = False
            response.error_log = str(exc)
            response.save(update_fields=["sent_ok", "error_log"])
        except:
            pass

        raise self.retry(exc=exc, countdown=60)  # reintento en 1 min