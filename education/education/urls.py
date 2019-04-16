# -*- coding: utf-8 -*-
"""education URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.conf import settings
from django.contrib import admin
from rest_framework_swagger.views import get_swagger_view

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^api/docs/', get_swagger_view(title='在线选课系统接口文档')),
    url(r'^auth/api/', include('rest_framework.urls')),
    url(r'^rest-auth/api/', include('rest_auth.urls')),
    url(r'users/api/', include('users.api.urls')),
    url(r'tutor/api/', include('tutor.api.urls')),
    url(r'post/api/', include('post.api.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
