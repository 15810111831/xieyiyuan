# -*- coding: utf-8 -*-

from django.contrib import admin
from users.models import Way


class WayAdmin(admin.ModelAdmin):

    fields = ('name',)


admin.site.register(Way, WayAdmin)
