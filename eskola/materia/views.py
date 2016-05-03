from django.views.generic.base import TemplateView
from models import Materia
from rest_framework import viewsets
from materia.serializers import MateriaSerializer


class MateriaViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Materia.objects.all()
    serializer_class = MateriaSerializer


class MateriaView(TemplateView):
    template_name = 'index.html'
