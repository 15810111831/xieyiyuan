# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from users.models import User, Position, Subject, Way, Price, District, School
from datetime import datetime


class TeacherProfile(models.Model):
    '''教师信息'''

    user = models.ForeignKey(User, verbose_name='用户')

    gender_type = (
        (1, '男'),
        (2, '女')
    )
    gender = models.SmallIntegerField('性别', choices=gender_type)
    mobile = models.CharField('手机号', max_length=11, unique=True, error_messages={
        'unique': "相同手机号已存在",
    })
    email = models.CharField("邮箱", max_length=50)
    head_img = models.ImageField('头像', upload_to="headimgs", null=True, blank=True)
    name = models.CharField('姓名', max_length=32)
    birthday = models.DateField('出生日期')
    from_province = models.CharField('来自省份', max_length=50)

    education_choices = (
        (1, '大专以下'),
        (2, '大专在读'),
        (3, '大专毕业'),
        (4, '本科在读'),
        (5, '本科毕业'),
        (6, '研究生在读'),
        (7, '硕士在读'),
        (8, '硕士毕业'),
        (9, '博士在读'),
        (10, '博士毕业'),
    )
    education = models.SmallIntegerField('目前学历', choices=education_choices)
    id_code = models.CharField('身份证', max_length=18)
    school = models.ForeignKey(School, verbose_name='毕业高校')
    specialty = models.CharField('专业', max_length=50)

    position = models.ForeignKey(Position, verbose_name='目前身份')
    teach = models.CharField('任教学科', null=True, blank=True, max_length=50)
    teach_age = models.IntegerField('教龄', null=True, blank=True)

    # 省份
    province = models.CharField('省份', max_length=30)
    # 生活住所
    life_area = models.ForeignKey(District, verbose_name='生活住所', related_name='life_area')
    # 工作住所
    work_area = models.ForeignKey(District, verbose_name='工作住所', related_name='work_area')
    address = models.CharField('通讯地址', max_length=100)
    postal_code = models.CharField('邮编', max_length=10)

    status_choices = (
        (1, '待审核'),
        (2, '审核中'),
        (3, '审核通过'),
        (4, '审核失败')
    )
    status = models.SmallIntegerField('审核状态', choices=status_choices, default=1)
    pass_datetime = models.DateTimeField('审核通过时间', null=True, blank=True)

    '''其他信息'''
    id_code_pic = models.ImageField('身份证', upload_to='%Y/%m/%d', null=True, blank=True)
    info = models.TextField('自我描述', null=True, blank=True)
    description = models.TextField('详情描述', null=True, blank=True)
    cert = models.TextField('获得证书', null=True, blank=True)
    resume = models.TextField('家教简历', null=True, blank=True)

    subjects = models.ManyToManyField(Subject, verbose_name='可授科目')
    teach_area = models.ManyToManyField(District, verbose_name='可授课区域')
    way = models.ManyToManyField(Way, verbose_name='可授课方式')
    price = models.ManyToManyField(Price, verbose_name='薪水要求')

    rate_choices = (
        (1, '一星教师'),
        (2, '二星教师'),
        (3, '中级教师'),
        (4, '高级教师'),
        (5, '金牌教师'),
    )
    rate = models.SmallIntegerField('评分', choices=rate_choices, null=True, blank=True)

    def save(self, *args, **kwargs):
        if self.status == 3:
            self.pass_datetime = datetime.now()

        return super(TeacherProfile, self).save(*args, **kwargs)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '教师信息'
        verbose_name_plural = '教师信息'
