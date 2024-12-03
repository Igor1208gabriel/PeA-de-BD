from rest_framework import viewsets
from api.models import *
from datetime import datetime
from api.serializers import *
from rest_framework.response import Response
from rest_framework.decorators import action
from django.db.models import Count, Max, Min, Sum

class PacienteViewSet(viewsets.ModelViewSet):
    queryset = Paciente.objects.all()
    serializer_class = PacienteSerializer 


    @action(detail=False, methods=['get'])
    def soma_paciente(self, request):
        paciente_id = request.query_params.get('paciente_id')

        if(paciente_id):
            consultas = Consulta.objects.filter(paciente=paciente_id, status="Pago")
        else:
            consultas = Consulta.objects.filter(status="Pago")

        valor_total = consultas.aggregate(Sum('valor'))['valor__sum']
        quantidade_consultas = consultas.count()
        
        return Response({
            'Valor total': valor_total or 0,
            'Quantidade de consultas pagas': quantidade_consultas or 0,            
                        })



class ConsultaViewSet(viewsets.ModelViewSet):
    queryset = Consulta.objects.all()
    serializer_class = ConsultaSerializer 

    @action(detail=False, methods=['get'])
    def antes_de(self,request):
        data = request.query_params.get('data')
        if data:
            try:
                data_obj = datetime.strptime(data, '%d-%m-%Y') 
                consultas = Consulta.objects.filter(data__lt=data_obj)
                return Response(ConsultaSerializer(consultas, many=True).data)
            except ValueError:
                return Response({'error': 'Data inválida. Use o formato DD-MM-YYYY.'}, status=400)
        else:
            return Response({'error': 'Parâmetro "data" é necessário.'}, status=400)

    @action(detail=False, methods=['get'])
    def depois_de(self,request):
        data = request.query_params.get('data')
        if data:
            try:
                data_obj = datetime.strptime(data, '%d-%m-%Y')
                consultas = Consulta.objects.filter(data__gt=data_obj)
                return Response(ConsultaSerializer(consultas, many=True).data)
            except ValueError:
                return Response({'error': 'Data inválida. Use o formato DD-MM-YYYY.'}, status=400)
        else:
            return Response({'error': 'Parâmetro "data" é necessário.'}, status=400)

    @action(detail=False, methods=['get'])
    def entre(self,request):
        data_antes = request.query_params.get('data_antes')
        data_depois = request.query_params.get('data_depois')
        if data_antes and data_depois:
            try:
                data_antes_obj = datetime.strptime(data_antes, '%d-%m-%Y')
                data_depois_obj = datetime.strptime(data_depois, '%d-%m-%Y')
                consultas = Consulta.objects.filter(data__range=[data_antes_obj, data_depois_obj])
                return Response(ConsultaSerializer(consultas, many=True).data)
            except ValueError:
                return Response({'error': 'Datas inválidas. Use o formato DD-MM-YYYY.'}, status=400)
        else:
            return Response({'error': 'Os parâmetros "data_antes" e "data_depois" são necessários.'}, status=400)

