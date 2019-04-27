# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from tutor.models import Engage
from users.models import User


class ChoiceTeacher(models.Model):
    '''选择教师'''

    user = models.ForeignKey(User, verbose_name='教师')
    engage = models.ForeignKey(Engage, verbose_name='请家教信息')
    student = models.ForeignKey(User, verbose_name="学员", related_name="student_set")
    status_choices = (
        (1, '已选定'),
        (2, '退选')
    )
    status = models.SmallIntegerField('状态', choices=status_choices, default=1)
    start_date = models.DateField('开始日期')
    end_date = models.DateField('结束日期')

    price = models.IntegerField('价格')
    pay_status_choices = (
        (1, '未支付'),
        (2, '支付成功'),
        (3, '支付失败')
    )
    pay_status = models.SmallIntegerField('支付状态', choices=pay_status_choices, default=1)

    class Meta:
        verbose_name = '选择教师',
        verbose_name_plural = '选择教师'

    def teacher_name(self):
        return self.user.teacherprofile_set.all()[0].name

    def total_price(self):
        print (self.end_date.day - self.start_date.day)
        return (self.end_date.day - self.start_date.day) * self.price

    def start_date_str(self):
        return self.start_date.strftime("%Y-%m-%d")

    def end_date_str(self):
        return self.end_date.strftime("%Y-%m-%d")
