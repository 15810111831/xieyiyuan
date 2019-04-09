# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class School(models.Model):
    '''学校'''

    name = models.CharField('学校名称', max_length=50)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '学校'
        verbose_name_plural = '学校'
