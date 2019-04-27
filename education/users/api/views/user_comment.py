# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from users.api.serializers import UserCommentSerializer
from users.models import UserComment


class UserCommentViewSet(viewsets.GenericViewSet, mixins.ListModelMixin, mixins.CreateModelMixin):

    queryset = UserComment.objects.all()
    serializer_class = UserCommentSerializer
    filter_fields = ('user',)

    def get_queryset(self):
        return super(UserCommentViewSet, self).get_queryset().filter(status=2)
