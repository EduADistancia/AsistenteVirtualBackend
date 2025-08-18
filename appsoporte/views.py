from rest_framework import viewsets, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

from .models import Question, Costumer
from .serializers import QuestionSerializer


class QuestionViewSet(viewsets.ModelViewSet):
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer
    permission_classes = [IsAuthenticated]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)

        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        question = serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_costumer_email(request, idCostumer):
    try:
        costumer = Costumer.objects.get(idMoodle=idCostumer)
        return Response({"email": costumer.email}, status=status.HTTP_200_OK)
    except Costumer.DoesNotExist:
        return Response({"error": "ID no encontrado"}, status=status.HTTP_404_NOT_FOUND)
