# -*- coding: utf-8 -*-

from post.api.serializers import ArticleSerializer
from post.models import Article
from rest_framework import viewsets, mixins


class ArticleViewSet(viewsets.GenericViewSet, mixins.CreateModelMixin, mixins.ListModelMixin,
                     mixins.RetrieveModelMixin, mixins.UpdateModelMixin):

    queryset = Article.objects.all()
    serializer_class = ArticleSerializer
    search_fields = ('title', 'content')
    filter_fields = ('type__name', )

    def get_queryset(self):
        queryset = super(ArticleViewSet, self).get_queryset()
        return queryset.filter(status=2)

    def perform_create(self, serializer):
        data = self.request.data
        serializer.save(type_id=data['type'], user=data['user'])

    def perform_update(self, serializer):
        data = self.request.data
        serializer.save(type_id=data['type'], user=data['user'])
