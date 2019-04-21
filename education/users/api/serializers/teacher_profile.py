# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import TeacherProfile


class TeacherProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = TeacherProfile
        fields = (
            'id',
            'name',
            'gender',
            'mobile',
            'email',
            'head_img',
            'birthday',
            'from_province',
            'education',
            'id_code',
            'school',
            'specialty',
            'position',
            'province',
            'life_area',
            'work_area',
            'address',
            'postal_code',
            'id_code_pic',
            'info',
            'description',
            'cert',
            'resume',
            'subjects',
            'teach_area',
            'way',
            'price'
        )
