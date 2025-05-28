from rest_framework import serializers
from .models import ConsultaChatbot

class ConsultaChatbotSerializer(serializers.ModelSerializer):
    class Meta:
        model = ConsultaChatbot
        fields = '__all__'