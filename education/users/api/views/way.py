# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from users.api.serializers import WaySerializer
from users.models import Way


class WayViewSet(viewsets.GenericViewSet, mixins.ListModelMixin):

    queryset = Way.objects.all()
    permission_classes = []
    serializer_class = WaySerializer
