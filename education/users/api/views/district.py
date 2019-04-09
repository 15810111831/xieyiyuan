# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from users.api.serializers import DistrictSerializer
from users.models import District


class DistrictViewSet(viewsets.GenericViewSet, mixins.ListModelMixin):

    queryset = District.objects.all()
    permission_classes = []
    serializer_class = DistrictSerializer
