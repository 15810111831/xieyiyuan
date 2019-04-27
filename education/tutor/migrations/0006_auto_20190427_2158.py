# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-04-27 13:58
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('tutor', '0005_choiceteacher_student'),
    ]

    operations = [
        migrations.AddField(
            model_name='choiceteacher',
            name='end_date',
            field=models.DateField(default=datetime.datetime(2019, 4, 27, 13, 57, 59, 18497, tzinfo=utc), verbose_name='\u7ed3\u675f\u65e5\u671f'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='choiceteacher',
            name='price',
            field=models.IntegerField(default=111, verbose_name='\u4ef7\u683c'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='choiceteacher',
            name='start_date',
            field=models.DateField(default=datetime.datetime(2019, 4, 27, 13, 58, 10, 677474, tzinfo=utc), verbose_name='\u5f00\u59cb\u65e5\u671f'),
            preserve_default=False,
        ),
    ]
