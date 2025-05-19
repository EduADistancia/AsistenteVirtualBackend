from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

from .nlp.chatbot import predict_class, get_response, intents

@csrf_exempt  # Solo para pruebas. Más adelante usar autenticación o CSRF token.
def chat_view(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        message = data.get('message', '')

        if message:
            intents_list = predict_class(message)
            response = get_response(intents_list, intents)
            return JsonResponse({'response': response})
        else:
            return JsonResponse({'error': 'No message provided'}, status=400)
    
    return JsonResponse({'error': 'Invalid request'}, status=405)
