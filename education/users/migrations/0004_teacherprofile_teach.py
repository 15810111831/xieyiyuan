# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-04-11 09:00
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_auto_20190409_1548'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacherprofile',
            name='teach',
            field=models.CharField(blank=True, max_length=50, null=True, verbose_name='\u4efb\u6559\u5b66\u79d1'),
        ),
    ]
