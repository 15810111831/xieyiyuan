# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-04-16 03:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('post', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='status',
            field=models.SmallIntegerField(choices=[(1, '\u6b63\u5728\u5ba1\u6838'), (2, '\u5ba1\u6838\u901a\u8fc7'), (3, '\u5ba1\u6838\u5931\u8d25')], default=1, verbose_name='\u72b6\u6001'),
        ),
    ]
