# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Position(models.Model):
    '''身份'''

    name = models.CharField('身份', max_length=50)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '身份'
        verbose_name_plural = '身份'
