# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from users.models import User
from post.models import ArticleType


class Article(models.Model):
    '''文章'''

    title = models.CharField("标题", max_length=100)
    user = models.ForeignKey(User, verbose_name="创建人")
    type = models.ForeignKey(ArticleType, verbose_name='文章类别')
    content = models.TextField("内容")
    click_num = models.IntegerField('点击率', default=0)

    create_datetime = models.DateTimeField('创建时间', auto_now_add=True)
    update_datetime = models.DateTimeField('更新时间', auto_now=True)

    STATUS_CHOICES = (
        (1, '正在审核'),
        (2, '审核通过'),
        (3, '审核失败')
    )

    status = models.SmallIntegerField('状态', choices=STATUS_CHOICES, default=1)

    class Meta:
        verbose_name = '文章'
        verbose_name_plural = '文章'

    def __str__(self):
        return self.title

    def get_create_datetime(self):
        return self.create_datetime.strftime("%Y-%m-%d")

    def get_update_datetime(self):
        return self.update_datetime.strftime("%Y-%m-%d")
