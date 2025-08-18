from rest_framework import serializers
from .models import Question, Costumer


class QuestionSerializer(serializers.ModelSerializer):
    customer_idMoodle = serializers.CharField(write_only=True)
    customer = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = Question
        fields = ['id', 'customer', 'customer_idMoodle', 'text', 'override_email', 'status', 'created_at']
        read_only_fields = ['id', 'status', 'created_at', 'costumer']

    def create(self, validated_data):
        idMoodle = validated_data.pop('customer_idMoodle')
        
        try:
            customer = Costumer.objects.get(idMoodle=idMoodle)
        except Costumer.DoesNotExist:
            raise serializers.ValidationError({"customer_idMoodle": "Usuario no encontrado"})

        validated_data['customer'] = customer
        return super().create(validated_data)