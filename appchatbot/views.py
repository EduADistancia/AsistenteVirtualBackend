from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

from .nlp.chatbot import predict_class, get_response_with_related_intents, intents

@csrf_exempt
def chat_view(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        message = data.get('message', '')
        
        if message:
            intents_list = predict_class(message)
            response = get_response_with_related_intents(intents_list, intents)
            return JsonResponse(response)
        else:
            return JsonResponse({'error': 'No message provided'}, status=400)
    
    return JsonResponse({'error': 'Invalid request'}, status=405)
