# -*- coding: utf-8 -*-
'''
Created on 2014年12月23日

@author: heyuxing
'''
from django.template import loader

from xadmin.sites import site
from xadmin.views import BaseAdminPlugin, ListAdminView
'''
插件的插入点： {% view_block 'results_bottom' %}
关键点：view_block 和 results_bottom
'''
class HelloResultsbottomPlugin(BaseAdminPlugin):

    # Media
    def get_media(self, media):
        return media

    def block_results_bottom(self, context, nodes):
        nodes.append(loader.render_to_string('plugins/model_list.result_row.listoperate.html', context_instance=context))

site.register_plugin(HelloResultsbottomPlugin, ListAdminView)