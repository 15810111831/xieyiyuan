# -*- coding: utf-8 -*-

from django.contrib import admin
from users.models import UserComment


class UserCommentAdmin(admin.ModelAdmin):

    fields = ('user', 'creator', 'comment', 'status')


admin.site.register(UserComment, UserCommentAdmin)
