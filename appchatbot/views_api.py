from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import SessionAuthentication

from .models import ConsultaChatbot
from .serializers import ConsultaChatbotSerializer


class ConsultaChatbotAPIView(APIView):
    
    def get(self, request):
        authentication_classes = [SessionAuthentication]
        permission_classes = [IsAuthenticated]
        consultas = ConsultaChatbot.objects.all().order_by('-timestamp')
        serializer = ConsultaChatbotSerializer(consultas, many=True)
    
        return Response(serializer.data)