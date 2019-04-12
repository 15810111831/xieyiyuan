# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from rest_framework import permissions
from tutor.api.serializers import EngageSerializer
from tutor.models import Engage


class EngageViewSet(viewsets.GenericViewSet, mixins.CreateModelMixin,
                    mixins.ListModelMixin, mixins.RetrieveModelMixin):

    queryset = Engage.objects.all()
    serializer_class = EngageSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_permissions(self):
        if 'create' not in self.action:
            return []
        return super(EngageViewSet, self).get_permissions()
