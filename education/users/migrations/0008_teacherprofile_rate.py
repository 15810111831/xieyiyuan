# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-04-28 06:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0007_usercomment'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacherprofile',
            name='rate',
            field=models.SmallIntegerField(blank=True, choices=[(1, '\u4e00\u661f\u6559\u5e08'), (2, '\u4e8c\u661f\u6559\u5e08'), (3, '\u4e2d\u7ea7\u6559\u5e08'), (4, '\u9ad8\u7ea7\u6559\u5e08'), (5, '\u91d1\u724c\u6559\u5e08')], null=True, verbose_name='\u8bc4\u5206'),
        ),
    ]
