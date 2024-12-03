from django.urls import path, include
from rest_framework.routers import DefaultRouter
from api.views import *


router = DefaultRouter()
router.register(r'Paciente', PacienteViewSet)
router.register(r'Consulta', ConsultaViewSet)

urlpatterns = [
    path('', include(router.urls))
]