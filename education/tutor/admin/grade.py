# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from tutor.models import Grade


class GradeAdmin(admin.ModelAdmin):
    model = Grade
    fields = ('name',)


admin.site.register(Grade, GradeAdmin)
