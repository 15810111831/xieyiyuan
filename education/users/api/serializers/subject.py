# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import Subject


class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subject
        fields = (
            'id',
            'name'
        )
