# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Price(models.Model):
    '''薪水'''

    name = models.CharField('名字', max_length=50)
    price = models.IntegerField('价格')
    type_choices = (
        (1, '小时'),
        (2, '天')
    )
    type = models.SmallIntegerField('类别', choices=type_choices, default=1)

    def __unicode__(self):
        return '%s %s/%s' % (self.name, self.price, self.get_type_display())

    class Meta:
        verbose_name = '薪水'
        verbose_name_plural = '薪水'
