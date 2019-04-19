# -*- coding: utf-8 -*-

from rest_framework import serializers
from tutor.models import Engage


class EngageSerializer(serializers.ModelSerializer):

    create_datetime_str = serializers.CharField(source="get_create_datetime", read_only=True)

    class Meta:
        model = Engage
        fields = (
            'id',
            'user',
            'code',
            'name',
            'mobile',
            'district',
            'district_des',
            'gender',
            'grade',
            'subject',
            'class_begin',
            'description',
            'teacher_gender',
            'teacher_des',
            'charge',
            'get_gender_display',
            'get_teacher_gender_display',
            'create_datetime_str'
        )
        read_only_fields = ('get_gender_display', 'get_teacher_gender_display')
        depth = 1
