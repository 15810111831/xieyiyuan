# -*- coding: utf-8 -*-

from django.contrib import admin
from users.models import Position


class PositionAdmin(admin.ModelAdmin):

    fields = ('name',)


admin.site.register(Position, PositionAdmin)
