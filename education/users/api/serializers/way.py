# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import Way


class WaySerializer(serializers.ModelSerializer):
    class Meta:
        model = Way
        fields = (
            'id',
            'name'
        )
