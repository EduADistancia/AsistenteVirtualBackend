from rest_framework import viewsets, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

from .models import Question, Costumer, RolCostumer
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
        
        # Actualización de datos para automatriculados
        customer_id = request.data.get("customer_idMoodle")
        rol = request.data.get("rolCostumer")
        email_alt = request.data.get("override_email")
        customer = Costumer.objects.get(idMoodle=customer_id)
        updated = False
        
        if rol:
            customer.rol = RolCostumer.objects.get(rol=rol)
            updated = True
        
        if email_alt:
            customer.email = email_alt
            updated = True

        if updated:
            customer.save()
        
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_costumer_email(request, idCostumer):
    try:
        costumer = Costumer.objects.get(idMoodle=idCostumer)
        return Response({"email": costumer.email}, status=status.HTTP_200_OK)
    
    except Costumer.DoesNotExist:
        #Creación de automatriculados
        new_costumer = Costumer(idMoodle=str(idCostumer), rol=RolCostumer.objects.get(rol="Indefinido"))
        new_costumer.save()
        return Response({"new_costumer": "Creado con éxito"}, status=status.HTTP_201_CREATED)