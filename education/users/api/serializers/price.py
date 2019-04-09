# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import Price


class PriceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Price
        fields = (
            'id',
            'name',
            'price',
            'type',
            'get_type_display'
        )
        read_only_fields = ('get_type_display',)
