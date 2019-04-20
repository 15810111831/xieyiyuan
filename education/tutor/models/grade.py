# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Grade(models.Model):
    '''年级'''

    name = models.CharField('年级名称', max_length=32)

    class Meta:
        verbose_name = '年级',
        verbose_name_plural = '年级'

    def __str__(self):
        return self.name.encode("utf-8")
