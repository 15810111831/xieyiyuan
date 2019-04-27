# -*- coding: utf-8 -*-

from rest_framework import routers
from users.api.views import (
    UserViewSet, DistrictViewSet, PositionViewSet, PriceViewSet,
    SubjectViewSet, WayViewSet, SchoolViewSet, TeacherProfileViewSet, UserCommentViewSet
)


router = routers.SimpleRouter()

router.register(r'user', UserViewSet, base_name='user')
router.register(r'district', DistrictViewSet, base_name='district')
router.register(r'position', PositionViewSet, base_name='position')
router.register(r'price', PriceViewSet, base_name='price')
router.register(r'subject', SubjectViewSet, base_name='subject')
router.register(r'way', WayViewSet, base_name='way')
router.register(r'school', SchoolViewSet, base_name='school')
router.register(r'teacherprofile', TeacherProfileViewSet, base_name="teacherprofile")
router.register(r'usercomment', UserCommentViewSet, base_name='usercomment')
urlpatterns = router.urls
