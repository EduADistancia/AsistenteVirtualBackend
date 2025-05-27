from django.urls import path
from .views import CommentListCreateAPIView

urlpatterns = [
    path('api/comments/', CommentListCreateAPIView.as_view(), name='comment-list-create'),
]