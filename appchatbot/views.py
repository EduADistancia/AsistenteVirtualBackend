from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

from .nlp.chatbot import predict_class, get_response_with_related_intents, intents
from .models import ConsultaChatbot

@csrf_exempt
def chat_view(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        message = data.get('message', '')
        
        if message:
            intents_list = predict_class(message)
            response = get_response_with_related_intents(intents_list, intents)

            # Extraer datos para guardar
            predicted_tag = intents_list[0]['intent'] if intents_list else ''
            confidence = intents_list[0]['probability'] if intents_list else 0.0
            related_tags = ', '.join([item['intent'] for item in intents_list[1:]]) if len(intents_list) > 1 else ''

            # Guardar la consulta en la base
            ConsultaChatbot.objects.create(
                user_input=message,
                predicted_tag=predicted_tag,
                confidence=confidence,
                related_tags=related_tags
            )

            return JsonResponse(response)
        else:
            return JsonResponse({'error': 'No message provided'}, status=400)
    
    return JsonResponse({'error': 'Invalid request'}, status=405)
