from django.shortcuts import render


from django.views.generic.base import TemplateView
from rest_framework import viewsets
from serializers import MateriaSerializer
from models import Materia


class MateriaView(TemplateView):
    template_name = 'index.html'


class MateriaViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Materia.objects.all()
    serializer_class = MateriaSerializer
