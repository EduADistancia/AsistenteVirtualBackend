import requests

from django.conf import settings
from rest_framework import serializers

from .models import Comment

class CommentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Comment
        fields = '__all__'