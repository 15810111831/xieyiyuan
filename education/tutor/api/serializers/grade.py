# -*- coding: utf-8 -*-

from rest_framework import serializers
from tutor.models import Grade


class GradeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Grade
        fields = (
            'id',
            'name',
        )
