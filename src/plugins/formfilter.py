# -*- coding: utf-8 -*-
'''
Created on 2014年12月30日

@author: heyuxing
'''
from xadmin.sites import site
from xadmin.views import BaseAdminPlugin, ModelFormAdminView
class FormFilterPlugin(BaseAdminPlugin):
    
    form_filter_save_forms = None
    
    def init_request(self, *args, **kwargs):
        return True
        #return bool(self.request.is_ajax() or self.request.REQUEST.get('_ajax'))
    
    def get_context(self, __):
        c = {'key': 'value'}
        c.update(__())
        return c
    
    def get_context22(self, context):
        context.update({'hello_target': 'World!!'})
        return context
    
    def save_forms(self, __):
        #
        if self.form_filter_save_forms:
            self.form_filter_save_forms()
        print 'helllooooooooooooooo save_forms FormFilterPlugin'
        __()
        pass
    
site.register_plugin(FormFilterPlugin, ModelFormAdminView)