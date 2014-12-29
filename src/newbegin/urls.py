# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from newbegin.settings import MEDIA_URL

import xadmin
xadmin.autodiscover()

# version模块自动注册需要版本控制的 Model
from xadmin.plugins import xversion
xversion.register_models()

urlpatterns = patterns('',
    url(r'^', include(xadmin.site.urls)),
    (r'^smedia/(?P<path>.*)$', 'django.views.static.serve', {'document_root': MEDIA_URL, 'show_indexes': True }),
)
