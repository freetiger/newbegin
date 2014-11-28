# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
import xadmin
xadmin.autodiscover()

# version模块自动注册需要版本控制的 Model
urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'newbegin.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^', include(xadmin.site.urls)),
)
