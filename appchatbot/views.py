import json

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

from .models import ConsultaChatbot
from appsoporte.models import Costumer
from .nlp.chatbot import predict_class, get_response_with_related_intents, intents


@csrf_exempt
def chat_view(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'JSON inválido'}, status=400)

        message = data.get('message', '').strip()
        user_id = data.get('user_id', '').strip()

        if not message:
            return JsonResponse({'error': 'No se recibió consulta'}, status=400)
        if not user_id:
            return JsonResponse({'error': 'No se recibió usuario de Moodle'}, status=400)

        try:
            customer = Costumer.objects.get(idMoodle=user_id)
        except Costumer.DoesNotExist:
            return JsonResponse({'error': f'Usuario con id {user_id} no encontrado'}, status=404)

        intents_list = predict_class(message)
        response = get_response_with_related_intents(intents_list, intents)

        predicted_tag = intents_list[0]['intent'] if intents_list else ''
        confidence = intents_list[0]['probability'] if intents_list else 0.0
        related_tags = ', '.join([item['intent'] for item in intents_list[1:]]) if len(intents_list) > 1 else ''

        ConsultaChatbot.objects.create(
            user_input=message,
            predicted_tag=predicted_tag,
            confidence=confidence,
            related_tags=related_tags,
            user_id=customer
        )

        return JsonResponse(response)

    return JsonResponse({'error': 'Invalid request'}, status=405)