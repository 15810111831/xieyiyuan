# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from post.models import ArticleType


class ArticleTypeAdmin(admin.ModelAdmin):
    fields = ('id', 'name')


admin.site.register(ArticleType, ArticleTypeAdmin)
