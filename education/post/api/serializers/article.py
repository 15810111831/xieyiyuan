# -*- coding: utf-8 -*-

from rest_framework import serializers
from post.models import Article


class ArticleSerializer(serializers.ModelSerializer):

    create_datetime_str = serializers.CharField(source='get_create_datetime', read_only=True)
    update_datetime_str = serializers.CharField(source='get_update_datetime', read_only=True)

    class Meta:
        model = Article
        fields = (
            'id',
            'title',
            'content',
            'type',
            'user',
            'create_datetime',
            'update_datetime',
            'status',
            'click_num',
            'get_status_display',
            'create_datetime_str',
            'update_datetime_str'
        )
        read_only_fields = ('get_status_display',)
        depth = 1
