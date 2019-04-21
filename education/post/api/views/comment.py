# -*- coding: utf-8 -*-

from post.api.serializers import CommentSerializer
from post.models import Comment
from rest_framework import viewsets, mixins


class CommentViewSet(viewsets.GenericViewSet, mixins.ListModelMixin, mixins.CreateModelMixin):

    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    filter_fileds = ('article',)

    def get_queryset(self):
        queryset = super(CommentViewSet, self).get_queryset()
        return queryset.filter(status=2)

    def perform_create(self, serializer):
        data = self.request.data
        comment = data.get("comment", None)
        if comment is None:
            serializer.save(user_id=data['user'], article_id=data['article'])
        else:
            serializer.save(user_id=data['user'], article_id=data['article'], comment_id=data['comment'])

    def get_permissions(self):
        if 'create' not in self.action:
            return []
        return super(CommentViewSet, self).get_permissions()
