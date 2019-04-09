# -*- coding: utf-8 -*-

from django.contrib import admin
from users.models import District


class DistrictAdmin(admin.ModelAdmin):

    fields = ('name',)


admin.site.register(District, DistrictAdmin)
