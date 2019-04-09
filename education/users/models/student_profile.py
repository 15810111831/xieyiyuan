# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from users.models import User


class StudentProfile(models.Model):
    '''学生信息'''

    user = models.ForeignKey(User, verbose_name='用户')

    gender_type = (
        (1, '男'),
        (2, '女')
    )
    gender = models.SmallIntegerField('性别', choices=gender_type)

    name = models.CharField('姓名', max_length=32)
    mobile = models.CharField('手机号', max_length=11, unique=True, error_messages={
        'unique': "相同手机号已存在",
    })

    address = models.CharField('通讯地址', max_length=100)
    postal_code = models.CharField('邮编', max_length=10)

    class Meta:
        verbose_name = '学生信息'
        verbose_name_plural = '学生信息'
