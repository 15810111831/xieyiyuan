# -*- coding: utf-8 -*-

from rest_framework import serializers
from users.models import User


class UserSerializer(serializers.ModelSerializer):

    teacher_name = serializers.CharField(source='get_teacher_name', read_only=True)
    teacher_gender = serializers.CharField(source='get_teacher_gender', read_only=True)
    teacher_position_name = serializers.CharField(source='get_teacher_position', read_only=True)
    teacher_subject_name = serializers.CharField(source='get_teacher_subject', read_only=True)
    teacher_specialty = serializers.CharField(source='get_teacher_specialty', read_only=True)
    teacher_school = serializers.CharField(source='get_teacher_school', read_only=True)
    create_datetime_str = serializers.CharField(source='get_create_datetime', read_only=True)
    teacher_pass_datetime = serializers.CharField(source='get_teacher_pass_datetime', read_only=True)

    class Meta:
        model = User
        fields = (
            'id',
            'username',
            'password',
            'type',
            'create_datetime',
            'update_datetime',
            'get_type_display',
            'teacherprofile_set',
            'studentprofile_set',
            'teacher_name',
            'teacher_gender',
            'create_datetime_str',
            'teacher_pass_datetime',
            'teacher_position_name',
            'teacher_subject_name',
            'teacher_specialty',
            'teacher_school'
        )
        read_only_fields = ('get_type_display', 'create_datetime', 'update_datetime')
        extra_kwargs = {'password': {'write_only': True}}

        depth = 1

    def create(self, validated_data):
        user = User(
            username=validated_data['username'],
            type=validated_data['type']
        )
        user.set_password(validated_data['password'])
        user.save()
        return user
