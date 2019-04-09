# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from users.api.serializers import PositionSerializer
from users.models import Position


class PositionViewSet(viewsets.GenericViewSet, mixins.ListModelMixin):

    queryset = Position.objects.all()
    permission_classes = []
    serializer_class = PositionSerializer
