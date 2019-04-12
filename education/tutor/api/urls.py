# -*- coding: utf-8 -*-

from rest_framework import routers
from tutor.api.views import EngageViewSet

router = routers.SimpleRouter()

router.register(r'engage', EngageViewSet, base_name='engage')

urlpatterns = router.urls
