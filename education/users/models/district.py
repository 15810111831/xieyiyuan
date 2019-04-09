# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class District(models.Model):
    '''区县'''

    name = models.CharField('名字', max_length=50)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '区县'
        verbose_name_plural = '区县'
