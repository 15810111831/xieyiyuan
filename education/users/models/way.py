# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Way(models.Model):
    '''授课方式'''

    name = models.CharField('名字', max_length=50)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '授课方式'
        verbose_name_plural = '授课方式'
