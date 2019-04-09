# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import Position


class PositionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Position
        fields = (
            'id',
            'name'
        )
