from django.shortcuts import render

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import SessionAuthentication

from .models import Comment
from .serializers import CommentSerializer


class CommentListCreateAPIView(APIView):
    # authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]
    
    def get(self, request):
        comments = Comment.objects.all().order_by('-date_comment')
        serializer = CommentSerializer(comments, many=True)
        
        return Response(serializer.data)

    def post(self, request):
        
        if request.user.email != 'angularapp@bue.edu.ar':
            return Response({'detail': 'No autorizado'}, status=403)
        
        serializer = CommentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        
        print(serializer.errors)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)