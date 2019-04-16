# -*- coding: utf-8 -*-

from rest_framework import serializers
from post.models import ArticleType


class ArticleTypeSerializer(serializers.ModelSerializer):

    class Meta:
        model = ArticleType
        fields = (
            'id',
            'name',
        )
