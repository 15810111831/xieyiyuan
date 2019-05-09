# -*- coding: utf-8 -*-

from post.api.serializers import ArticleTypeSerializer
from post.models import ArticleType
from rest_framework import viewsets, mixins


class ArticleTypeViewSet(viewsets.GenericViewSet, mixins.ListModelMixin):

    queryset = ArticleType.objects.all()
    serializer_class = ArticleTypeSerializer
    filter_fields = ('name', )
