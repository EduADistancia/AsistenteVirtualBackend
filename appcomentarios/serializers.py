import requests

from django.conf import settings
from rest_framework import serializers

from .models import Comment

class CommentSerializer(serializers.ModelSerializer):
    g_recaptcha_response = serializers.CharField(write_only=True)

    class Meta:
        model = Comment
        fields = '__all__'

    def validate_g_recaptcha_response(self, value):
        secret = settings.RECAPTCHA_SECRET_KEY
        response = value

        verify_url = "https://www.google.com/recaptcha/api/siteverify"
        payload = {
            'secret': secret,
            'response': response
        }

        r = requests.post(verify_url, data=payload)
        result = r.json()

        if not result.get("success"):
            raise serializers.ValidationError("Captcha inválido. Intenta nuevamente.")

        return value