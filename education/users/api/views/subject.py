# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from users.api.serializers import SubjectSerializer
from users.models import Subject


class SubjectViewSet(viewsets.GenericViewSet, mixins.ListModelMixin):

    queryset = Subject.objects.all()
    permission_classes = []
    serializer_class = SubjectSerializer
