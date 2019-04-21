# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from post.models import Article
from users.models import User


class Comment(models.Model):
    '''评论'''

    article = models.ForeignKey(Article, verbose_name="文章")
    user = models.ForeignKey(User, verbose_name="用户")
    content = models.TextField("评论内容")
    comment = models.ForeignKey('self', verbose_name="回复评论", null=True, blank=True, related_name='child_set')
    create_datetime = models.DateTimeField('创建时间', auto_now=True)

    status_choices = (
        (1, '正在审核'),
        (2, '审核成功'),
        (3, '审核失败')
    )
    status = models.SmallIntegerField('状态', choices=status_choices, default=1)

    class Meta:
        verbose_name = '评论'
        verbose_name_plural = '评论'

    def __str__(self):
        return self.content[:20]

    def get_create_datetime(self):
        return self.create_datetime.strftime("%Y-%m-%d %H:%M:%S")
