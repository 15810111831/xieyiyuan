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

    class Meta:
        verbose_name = '选择教师',
        verbose_name_plural = '选择教师'

    def teacher_name(self):
        return self.user.teacherprofile_set.all()[0].name
