# -*- coding: utf-8 -*-

from rest_framework import routers
from tutor.api.views import EngageViewSet, GradeViewSet, ChoiceTeacherViewSet

router = routers.SimpleRouter()

router.register(r'engage', EngageViewSet, base_name='engage')
router.register(r'grade', GradeViewSet, base_name='grade')
router.register(r'choiceteacher', ChoiceTeacherViewSet, base_name='choiceteacher')

urlpatterns = router.urls
