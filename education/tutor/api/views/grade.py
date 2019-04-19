# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from tutor.api.serializers import GradeSerializer
from tutor.models import Grade


class GradeViewSet(viewsets.GenericViewSet, mixins.ListModelMixin):

    queryset = Grade.objects.all()
    serializer_class = GradeSerializer
    permission_classes = []
