from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Materia(models.Model):
    name = models.CharField(max_length=250)
    description = models.TextField(max_length=1000)

    def __str__(self):
        return '%s' % self.name, self.description
