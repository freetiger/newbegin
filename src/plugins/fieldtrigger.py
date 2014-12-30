# -*- coding: utf-8 -*-
'''
Created on 2014年12月30日

@author: heyuxing
'''
from xadmin.sites import site
from xadmin.views import BaseAdminPlugin, ModelFormAdminView

'''
不是想要的
'''
class FieldTriggerPlugin(BaseAdminPlugin):

    list_gallery = False

    def init_request(self, *args, **kwargs):
        return False

    # Media
    def get_media(self, media):
        return media + self.vendor('image-gallery.js', 'image-gallery.css')

    def block_before_fieldsets(self, context, node):
        return '<div id="gallery" data-toggle="modal-gallery" data-target="#modal-gallery">helllllll'

    def block_after_fieldsets(self, context, node):
        return "Hello World!</div>"


site.register_plugin(FieldTriggerPlugin, ModelFormAdminView)
