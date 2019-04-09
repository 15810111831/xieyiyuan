# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import District


class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = (
            'id',
            'name'
        )
