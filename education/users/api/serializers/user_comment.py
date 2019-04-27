# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import UserComment


class UserCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserComment
        fields = (
            'id',
            'user',
            'comment',
            'parent',
            'creator',
            'create_datetime',
            'create_date',
            'creator_name',
            'status'
        )
        read_only_fields = ('create_date', 'creator_name')
