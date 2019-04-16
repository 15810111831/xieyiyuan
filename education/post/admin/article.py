# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from post.models import Article


class ArticleAdmin(admin.ModelAdmin):
    fields = ('title', 'user', 'type', 'content', 'click_num', 'status')
    list_display = ('title', )


admin.site.register(Article, ArticleAdmin)
