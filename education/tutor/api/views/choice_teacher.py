# -*- coding: utf-8 -*-

from rest_framework import viewsets, mixins
from rest_framework.validators import ValidationError
from tutor.api.serializers import ChoiceTeacherSerializer
from tutor.models import ChoiceTeacher, Engage
from users.models import User


class ChoiceTeacherViewSet(viewsets.GenericViewSet, mixins.ListModelMixin, mixins.CreateModelMixin,
                           mixins.UpdateModelMixin):

    queryset = ChoiceTeacher.objects.all()
    serializer_class = ChoiceTeacherSerializer
    filter_fields = ('student',)

    def perform_create(self, serializer):
        data = self.request.data
        exists = ChoiceTeacher.objects.filter(user_id=data['user']).exists()
        print data
        if exists:
            raise ValidationError('该教师已被选中')
        serializer.save(user_id=data['user'], engage_id=data['engage'], student_id=data['student'])

    def perform_update(self, serializer):
        data = self.request.data
        if data.get('user', None):
            serializer.user = User.objects.get(pk=data['user'])
        if data.get('engage', None):
            serializer.engage = Engage.objects.get(pk=data['engage'])
        serializer.save()

    def get_permissions(self):
        if self.action != 'create':
            return []
        return super(ChoiceTeacherViewSet, self).get_permissions()
