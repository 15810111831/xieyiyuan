# -*- coding: utf-8 -*-

from rest_framework import viewsets
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.authtoken.models import Token
from users.api.serializers import UserSerializer
from users.models import User, TeacherProfile, StudentProfile


class UserViewSet(viewsets.ModelViewSet):

    queryset = User.objects.all()
    serializer_class = UserSerializer
    filter_fields = (
        'type',
        'teacherprofile__gender',
        'teacherprofile__education',
        'teacherprofile__status',
        'teacherprofile__subjects',
        'teacherprofile__school',
        'teacherprofile__position',
    )
    search_fields = ('teacherprofile__position__name', 'teacherprofile__subjects__name',
                     'teacherprofile__life_area__name', 'teacherprofile__school__name')

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance = serializer.save()
        Token.objects.create(user=instance)
        data = request.data

        if instance.type == 1:
            try:
                TeacherProfile.objects.create(
                    user=instance,
                    mobile=data['mobile'],
                    gender=data['gender'],
                    name=data['name'],
                    birthday=data['birthday'],
                    from_province=data['from_province'],
                    education=data['education'],
                    id_code=data['id_code'],
                    school_id=data['school'],
                    specialty=data['specialty'],
                    position_id=data['position'],
                    teach_age=data.get('teach_age', None),
                    province=data['province'],
                    life_area_id=data['life_area'],
                    work_area_id=data['work_area'],
                    address=data['address'],
                    postal_code=data['postal_code'],
                )
            except Exception as e:
                print e
                User.objects.filter(pk=instance.id).delete()
                return Response({'detail': '已存在相同手机号用户'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            try:
                StudentProfile.objects.create(
                    user=instance,
                    gender=data['gender'],
                    name=data['name'],
                    mobile=data['mobile'],
                    address=data['address'],
                    postal_code=data['postal_code']
                )
            except Exception:
                User.objects.filter(pk=instance.id).delete()
                return Response({'detail': '已存在相同手机号用户'}, status=status.HTTP_400_BAD_REQUEST)

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def perform_update(self, serializer):
        data = self.request.data
        instance = serializer.save()
        if instance.type == 1:
            if data.get('info', ''):
                instance.info = data['info']
            if data.get('description', ''):
                instance.description = data['description']
            if data.get('cert', ''):
                instance.cert = data['cert']
            if data.get('resume', ''):
                instance.resume = data['resume']
            instance.save()

    @action(methods=['get'], detail=False)
    def get_user_info(self, request):
        key = request.query_params.get('key', '')
        if not key:
            return Response({'detail': '请传入用户的key'}, status=status.HTTP_400_BAD_REQUEST)

        user = Token.objects.get(key=key).user
        serializer = UserSerializer(user)
        return Response(serializer.data)

    @action(methods=['post'], detail=True)
    def upload_id_pic(self, request, pk):
        instance = self.get_object()
        file = request.FILES.get('id_code_pic', None)
        print file
        if not file:
            return Response({'detail': '请传入图片'}, status=status.HTTP_400_BAD_REQUEST)
        teacherprofile = instance.teacherprofile_set.first()
        print teacherprofile
        teacherprofile.id_code_pic.save('id_code_pic', file)
        return Response({'detail': '上传成功'}, status=status.HTTP_200_OK)

    def get_permissions(self):
        if self.action == 'create' or self.action == 'list':
            return []
        return super(UserViewSet, self).get_permissions()
