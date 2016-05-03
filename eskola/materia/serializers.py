from models import Materia
from rest_framework import serializers


class MateriaSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Materia
        fields = ('url', 'name', 'description')
