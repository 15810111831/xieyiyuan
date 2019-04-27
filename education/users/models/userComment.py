# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from users.models import User


class UserComment(models.Model):
    '''教师评价'''

    comment = models.TextField('名字')
    user = models.ForeignKey(User, verbose_name='用户')
    create_datetime = models.DateTimeField('创建时间', auto_now=True)
    parent = models.ForeignKey("self", verbose_name='评论', null=True, blank=True)
    creator = models.ForeignKey(User, verbose_name='创建人', related_name='creator_set')
    status_choices = (
        (1, '正在审核'),
        (2, '审核通过'),
        (3, '审核失败')
    )
    status = models.SmallIntegerField("状态", choices=status_choices, default=1)

    def __unicode__(self):
        return self.comment[:20]

    class Meta:
        verbose_name = '教师评价'
        verbose_name_plural = '教师评价'

    def create_date(self):
        return self.create_datetime.strftime("%Y-%m-%d")

    def creator_name(self):
        return self.creator.username
