# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from users.api.serializers import SchoolSerializer
from users.models import School


class SchoolViewSet(viewsets.GenericViewSet, mixins.ListModelMixin):

    queryset = School.objects.all()
    permission_classes = []
    serializer_class = SchoolSerializer
