# -*- coding: utf-8 -*-

from rest_framework import serializers
from tutor.models import ChoiceTeacher


class ChoiceTeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChoiceTeacher
        fields = (
            'id',
            'user',
            'engage',
            'student',
            'status',
            'get_status_display',
            'teacher_name',
            'start_date',
            'end_date',
            'start_date_str',
            'end_date_str',
            'total_price',
            'price',
            'pay_status',
            'get_pay_status_display'
        )
        read_only_fields = ('get_status_display', 'teacher_name', 'start_date_str',
                            'end_date_str', 'total_price', 'get_pay_status_display')
        depth = 1
