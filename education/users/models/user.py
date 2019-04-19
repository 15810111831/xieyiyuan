# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import AbstractUser, Group
from django.contrib.auth.validators import ASCIIUsernameValidator


class User(AbstractUser):
    '''自定义用户'''

    username_validator = ASCIIUsernameValidator()
    username = models.CharField(
        '用户名',
        max_length=150,
        unique=True,
        validators=[username_validator],
        error_messages={
            'unique': '相同登录名的用户已经存在',
        },
    )

    groups = models.ManyToManyField(
        Group,
        verbose_name='角色',
        blank=True
    )

    is_active = models.BooleanField('启用', default=True)
    is_staff = models.BooleanField('是否可以登录后台', default=False)
    create_datetime = models.DateTimeField('创建时间', auto_now_add=True)
    update_datetime = models.DateTimeField('修改时间', auto_now=True)

    type_choices = (
        (1, '教师'),
        (2, '学生')
    )
    type = models.SmallIntegerField('类别', choices=type_choices, null=True, blank=True)

    def __unicode__(self):
        return self.username

    def get_teacher_name(self):
        teacherprofile = self.teacherprofile_set.all()
        return teacherprofile[0].name if teacherprofile else ''

    def get_teacher_gender(self):
        teacherprofile = self.teacherprofile_set.all()
        return teacherprofile[0].get_gender_display() if teacherprofile else ''

    def get_teacher_position(self):
        teacherprofile = self.teacherprofile_set.all()
        return teacherprofile[0].position.name if teacherprofile else ''

    def get_teacher_subject(self):
        teacherprofile = self.teacherprofile_set.all()
        if teacherprofile and teacherprofile[0].subjects.all():
            return teacherprofile[0].subjects.all()
        else:
            return ''

    def get_teacher_specialty(self):
        teacherprofile = self.teacherprofile_set.all()
        return teacherprofile[0].specialty if teacherprofile else ''

    def get_teacher_school(self):
        teacherprofile = self.teacherprofile_set.all()
        return teacherprofile[0].school.name if teacherprofile else ''

    def get_create_datetime(self):
        return self.create_datetime.strftime('%Y-%m-%d')

    def get_teacher_pass_datetime(self):
        teacherprofile = self.teacherprofile_set.all()
        if teacherprofile and teacherprofile[0].status == 3:
            return teacherprofile[0].pass_datetime.strftime('%Y-%m-%d')
        else:
            return ''

    def get_teach_area(self):
        teacherprofile = self.teacherprofile_set.all()
        area_list = []
        if teacherprofile and teacherprofile[0].teach_area.all():
            area_list = teacherprofile.values_list('teach_area__name', flat=True)
        return ";".join(area_list)

    def get_teach_way(self):
        teacherprofile = self.teacherprofile_set.all()
        way_list = []
        if teacherprofile and teacherprofile[0].way.all():
            way_list = teacherprofile.values_list('way__name', flat=True)
        return ";".join(way_list)

    def get_price(self):
        teacherprofile = self.teacherprofile_set.all()
        price_list = []
        if teacherprofile and teacherprofile[0].price.all():
            price_list = teacherprofile.values_list('price__name', flat=True)
        return ";".join(price_list)

    def get_education(self):
        teacherprofile = self.teacherprofile_set.all()
        return teacherprofile[0].get_education_display() if teacherprofile else ''
