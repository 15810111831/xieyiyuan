# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-04-27 14:08
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tutor', '0006_auto_20190427_2158'),
    ]

    operations = [
        migrations.AddField(
            model_name='choiceteacher',
            name='pay_status',
            field=models.SmallIntegerField(choices=[(1, '\u672a\u652f\u4ed8'), (2, '\u652f\u4ed8\u6210\u529f'), (3, '\u652f\u4ed8\u5931\u8d25')], default=1, verbose_name='\u652f\u4ed8\u72b6\u6001'),
        ),
    ]
