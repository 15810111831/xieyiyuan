# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Subject(models.Model):
    '''授课科目'''

    name = models.CharField('名字', max_length=50)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '授课科目'
        verbose_name_plural = '授课科目'
