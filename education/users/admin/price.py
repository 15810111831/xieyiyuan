# -*- coding: utf-8 -*-

from django.contrib import admin
from users.models import Price


class PriceAdmin(admin.ModelAdmin):

    fields = ('name', 'price', 'type')


admin.site.register(Price, PriceAdmin)
