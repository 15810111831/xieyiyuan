# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import User


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = (
            'id',
            'username',
            'password',
            'type',
            'create_datetime',
            'update_datetime',
            'get_type_display'
        )
        read_only_fields = ('get_type_display', 'create_datetime', 'update_datetime')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = User(
            username=validated_data['username'],
            type=validated_data['type']
        )
        user.set_password(validated_data['password'])
        user.save()
        return user
