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
        )
        read_only_fields = ('get_status_display', 'teacher_name')
        depth = 1
