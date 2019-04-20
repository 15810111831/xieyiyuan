# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class ArticleType(models.Model):
    '''文章类别'''

    name = models.CharField('类别名称', max_length=100)

    class Meta:
        verbose_name = '文章类别'
        verbose_name_plural = '文章类别'

    def __str__(self):
        return self.name.encode("utf-8")
