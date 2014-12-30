# -*- coding: utf-8 -*-
'''
Created on 2014年12月30日

@author: heyuxing
'''
from xadmin.sites import site
from xadmin.views import BaseAdminPlugin, ModelFormAdminView
class ProductFilterPlugin(BaseAdminPlugin):
    
    def init_request(self, *args, **kwargs):
        app_label = self.opts.app_label #包名
        model_name = self.opts.model_name   #模块名
        return 'salemanagement'==str(app_label) and 'product'==str(model_name)
    
#     def get_context(self, __):
#         c = {'key': 'value'}
#         c.update(__())
#         return c
#     
#     def get_context22(self, context):
#         context.update({'hello_target': 'World!!'})
#         return context
    
    '''
    xadmin.views.form.FormAdminView.save_forms
    @filter_hook
    '''
    def save_forms(self, __):
        #
        app_label = self.opts.app_label #包名
        model_name = self.opts.model_name   #模块名
        print app_label,model_name
        print 'helllooooooooooooooo save_forms FormFilterPlugin'
        __()
        pass
    
site.register_plugin(ProductFilterPlugin, ModelFormAdminView)