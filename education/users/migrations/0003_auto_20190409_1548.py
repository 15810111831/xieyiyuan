# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-04-09 07:48
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20190408_1533'),
    ]

    operations = [
        migrations.CreateModel(
            name='School',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='\u5b66\u6821\u540d\u79f0')),
            ],
            options={
                'verbose_name': '\u5b66\u6821',
                'verbose_name_plural': '\u5b66\u6821',
            },
        ),
        migrations.AlterModelOptions(
            name='price',
            options={'verbose_name': '\u85aa\u6c34', 'verbose_name_plural': '\u85aa\u6c34'},
        ),
        migrations.AlterField(
            model_name='teacherprofile',
            name='school',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.School', verbose_name='\u6bd5\u4e1a\u9ad8\u6821'),
        ),
    ]
