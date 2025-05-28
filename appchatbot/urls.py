from django.urls import path

from .views import chat_view
from .views_api import ConsultaChatbotAPIView

urlpatterns = [
    path('', chat_view, name='chat'),
    path('api/', ConsultaChatbotAPIView.as_view(), name='consultas'),
]