# -*- coding: utf-8 -*-

from django.contrib import admin
from users.models import User, TeacherProfile, StudentProfile


class TeacherProfileInlineAdmin(admin.StackedInline):
    model = TeacherProfile
    fieldsets = (
        (None, {
            'fields': ('name', 'birthday', 'gender', 'mobile', 'from_province')
        }),
        (None, {
            'fields': ('id_code', 'education', 'school', 'specialty', 'position')
        }),
        (
            None, {
                'fields': ('id_code_pic', 'head_img', 'status')
            }
        )
    )
    extra = 0


class StudentProfileInlineAdmin(admin.TabularInline):
    model = StudentProfile
    fields = ('name', 'gender', 'mobile', 'address', 'postal_code')
    extra = 0


class UserAdmin(admin.ModelAdmin):

    fields = ('username', 'type')
    inlines = [TeacherProfileInlineAdmin, StudentProfileInlineAdmin]


admin.site.register(User, UserAdmin)
