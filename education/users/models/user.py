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
