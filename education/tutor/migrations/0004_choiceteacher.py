# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-04-27 02:33
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('tutor', '0003_engage_create_datetime'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChoiceTeacher',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.SmallIntegerField(choices=[(1, '\u5df2\u9009\u5b9a'), (2, '\u9000\u9009')], default=1, verbose_name='\u72b6\u6001')),
                ('engage', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tutor.Engage', verbose_name='\u8bf7\u5bb6\u6559\u4fe1\u606f')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='\u6559\u5e08')),
            ],
            options={
                'verbose_name': ('\u9009\u62e9\u6559\u5e08',),
                'verbose_name_plural': '\u9009\u62e9\u6559\u5e08',
            },
        ),
    ]
