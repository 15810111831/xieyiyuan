# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from users.models import User, District
from .grade import Grade


class Engage(models.Model):
    '''请家教 -- 下单'''

    user = models.ForeignKey(User, verbose_name='用户')
    name = models.CharField('姓名', max_length=30)
    mobile = models.CharField('手机号', max_length=11)
    district = models.ForeignKey(District, verbose_name='所在区域', null=True, blank=True)
    district_des = models.CharField('授课地区详细描述', max_length=1000, null=True, blank=True)

    gender_type_choices = (
        (1, '男'),
        (2, '女'),
        (3, '均可')
    )
    gender = models.SmallIntegerField('性别', choices=gender_type_choices, null=True, blank=True)

    grade = models.ForeignKey(Grade, verbose_name='年级')
    subject = models.CharField('求教学科', max_length=100)
    class_begin = models.CharField('可上课时间', max_length=50, null=True, blank=True)
    description = models.TextField('学员情况描述', null=True, blank=True)

    teacher_gender = models.SmallIntegerField('性别', choices=gender_type_choices, null=True, blank=True)
    teacher_des = models.TextField('对教员其他要求', null=True, blank=True)
    charge = models.CharField('收费要求', max_length=50)

    class Meta:
        verbose_name = '请家教-下单'
        verbose_name_plural = '请家教-下单'
