# -*- coding: utf-8 -*-

from rest_framework import serializers
from post.models import Comment


class CommentSerializer(serializers.ModelSerializer):
    create_datetime_str = serializers.CharField(source="get_create_datetime", read_only=True)

    class Meta:
        model = Comment
        fields = (
            'id',
            'content',
            'user',
            'article',
            'comment',
            'create_datetime_str'
        )
