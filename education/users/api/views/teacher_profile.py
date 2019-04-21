# -*- coding: utf-8 -*-

from rest_framework import viewsets, mixins
from users.api.serializers import TeacherProfileSerializer
from users.models import TeacherProfile


class TeacherProfileViewSet(viewsets.GenericViewSet, mixins.UpdateModelMixin):

    queryset = TeacherProfile.objects.all()
    serializer_class = TeacherProfileSerializer
