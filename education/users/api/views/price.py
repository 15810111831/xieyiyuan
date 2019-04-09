# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from users.api.serializers import PriceSerializer
from users.models import Price


class PriceViewSet(viewsets.GenericViewSet, mixins.ListModelMixin):

    queryset = Price.objects.all()
    permission_classes = []
    serializer_class = PriceSerializer
