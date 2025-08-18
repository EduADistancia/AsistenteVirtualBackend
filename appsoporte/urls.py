from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import QuestionViewSet, get_costumer_email

router = DefaultRouter()
router.register(r'questions', QuestionViewSet, basename='questions')

urlpatterns = [
    path('', include(router.urls)),
    path("costumer/<int:idCostumer>/email/", get_costumer_email, name="get_costumer_email"),
]