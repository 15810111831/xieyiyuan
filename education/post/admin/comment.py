# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from post.models import Comment


class CommentAdmin(admin.ModelAdmin):
    fields = ('content', 'status', 'article', 'user')


admin.site.register(Comment, CommentAdmin)
