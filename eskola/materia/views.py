from django.shortcuts import render

# Create your views here.

from rest_framework import viewsets
from serializers import MateriaSerializer
from models import Materia


class MateriaViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Materia.objects.all()
    serializer_class = MateriaSerializer
