# -*- coding: utf-8 -*-

from rest_framework import routers
from post.api.views import ArticleViewSet, ArticleTypeViewSet

router = routers.SimpleRouter()

router.register(r'articletype', ArticleTypeViewSet, base_name='articletype')
router.register(r'article', ArticleViewSet, base_name='article')

urlpatterns = router.urls
