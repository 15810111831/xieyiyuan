# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import mixins
from rest_framework.authtoken.models import Token
from users.api.serializers import UserSerializer
from users.models import User, TeacherProfile, StudentProfile
from crequest.middleware import CrequestMiddleware


class UserViewSet(viewsets.GenericViewSet, mixins.CreateModelMixin,
                  mixins.UpdateModelMixin, mixins.RetrieveModelMixin):

    queryset = User.objects.all()
    serializer_class = UserSerializer

    def preform_create(self, serializer):
        instance = serializer.save()
        Token.objects.create(user=instance)
        request = CrequestMiddleware.get_request()
        data = request.POST
        if instance.type == 1:
            TeacherProfile.objects.create(
                user=instance,
                mobile=data['mobile'],
                gender=data['gender'],
                name=data['name'],
                birthday=data['birthday'],
                from_province=data['from_province'],
                education=data['education'],
                id_code=data['id_code'],
                school=data['school'],
                specialty=data['specialty'],
                position=data['position'],
                teach_age=data.get('teach_age', None),
                province=data['province'],
                life_area=data['life_area'],
                work_area=data['work_area'],
                address=data['address'],
                postal_code=data['postal_code'],
            )
        else:
            StudentProfile.objects.create(
                user=instance,
                gender=data['gender'],
                name=data['name'],
                mobile=data['mobile'],
                address=data['address'],
                postal_code=data['postal_code']
            )

    def get_permissions(self):
        if self.action == 'create':
            return []
        return super(UserViewSet, self).get_permissions()
