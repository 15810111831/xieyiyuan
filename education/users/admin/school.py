# -*- coding: utf-8 -*-

from django.contrib import admin
from users.models import School


class SchoolAdmin(admin.ModelAdmin):

    fields = ('name',)


admin.site.register(School, SchoolAdmin)
