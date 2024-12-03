from rest_framework import serializers
from api.models import *

class PacienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paciente 
        fields = '__all__'

class ConsultaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Consulta
        fields = '__all__'
