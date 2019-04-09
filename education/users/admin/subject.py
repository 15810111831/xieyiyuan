# -*- coding: utf-8 -*-

from django.contrib import admin
from users.models import Subject


class SubjectAdmin(admin.ModelAdmin):

    fields = ('name',)


admin.site.register(Subject, SubjectAdmin)
