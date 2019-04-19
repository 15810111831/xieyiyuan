# -*- coding: utf-8 -*-

from rest_framework import routers
from tutor.api.views import EngageViewSet, GradeViewSet

router = routers.SimpleRouter()

router.register(r'engage', EngageViewSet, base_name='engage')
router.register(r'grade', GradeViewSet, base_name='grade')

urlpatterns = router.urls
