# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import School


class SchoolSerializer(serializers.ModelSerializer):
    class Meta:
        model = School
        fields = (
            'id',
            'name'
        )
