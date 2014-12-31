# -*- coding: utf-8 -*-
'''
Created on 2014年11月26日

@author: heyuxing
'''
import xadmin
from xadmin.views.base import CommAdminView
# from xadmin.plugins.inline import Inline
from salemanagement.models import ProductSpec, BaseProduct, Product, Customer, OrderItem, Order, Test
from salemanagement.forms import CustomerForm

class GolbeSetting(object):
    # 设置主题可选择  
    enable_themes= True 
    use_bootswatch = True 
    # 设置系统标题  
    site_title='新起点销售管理系统' 
    site_footer  = '新起点销售管理系统'
    
#     reversion_enable = True

    # 设置菜单风格, 叠加起来  
    #menu_style = 'accordion' 
    apps_label_title = {  
           'salemanagement':u'业务管理',  
           'auth':u'用户权限',  
           'reversion':u'操作记录',  
    }  
    globe_search_models = [ProductSpec, BaseProduct, Product, Customer, OrderItem, Order]
    
xadmin.site.register(CommAdminView, GolbeSetting)

#参考newbegin.urls
# from reversion.models import Revision
# class ReversionAdmin(object):
#     model_icon = 'fa fa-exchange'
# 
#     list_display = ('__str__', 'date_created', 'user', 'comment')
#     list_display_links = ('__str__',)
# 
#     list_filter = ('date_created', 'user')
# 
# xadmin.site.register(Revision, ReversionAdmin)

class BaseAdmin(object):
    #导出
    list_export = ()
    list_export_fixed = ('xlsx', 'xls', 'csv', 'xml', 'json')
    #数据版本控制，默认记录10个版本，可以调整。恢复删除的数据
    reversion_enable = True
        #相关模块操作
    use_related_menu=False
    #操作列表
    #list_operate=['add', 'change', 'delete', 'detail', '<a href="www.github.com">github</a>', '<a href="http://www.github.com">http_github</a>'  ]
    list_operate=['delete', 'detail', ]
    
#     search_fileds = ('book__name', 'book__title', 'book__price', 'category')  # 设置搜索栏范围，如果有外键，要注明外键的哪个字段，双下划线
#     list_display = ('book', 'category')  # 在页面上显示的字段，若不设置则显示 models.py 中 __unicode__(self) 中所返回的值
#     list_display_links = ('category')  # 设置页面上哪个字段可单击进入详细页面
#     fields = ('category', 'book')  # 设置添加/修改详细信息时，哪些字段显示，在这里 remark 字段将不显示
    
#产品规格specification
class ProductSpecAdmin(BaseAdmin):
    list_display = ('name', 'value', 'create_date', 'update_date' )
    #设置搜索框和其模糊搜索的范围
    search_fields = ('name', 'value')
        
#基础产品（如：Intel CPU，其下又可以细分不同版本型号i4，i5，i6、颜色白色，灰色。Intel CPU就是基础产品，白色i5Intel CPU就是标准产品）
class BaseProductAdmin(BaseAdmin):
    list_display = ('name', 'code', 'pinyin', 'unit', 'price', 'cost', 'point', 'create_date', 'update_date' )
    #设置搜索框和其模糊搜索的范围
    search_fields = ['name', 'code', 'pinyin']
    #采用搜索框，搜索时才查询相关数据
    #relfield_style = 'fk-ajax'
    #fields = ('name', 'unit', 'price', 'cost', 'point', )
    
        
#标准产品（如：Intel CPU，其下又可以细分不同版本型号i4，i5，i6、颜色白色，灰色。Intel CPU就是基础产品，白色i5Intel CPU就是标准产品）
class ProductAdmin(BaseAdmin):
    list_display = ('base_product', 'product_spec', 'unit', 'price', 'cost', 'point', 'create_date', 'update_date' )
    #设置搜索框和其模糊搜索的范围
    search_fields = ['base_product__name', 'base_product__code', 'base_product__pinyin', 'product_spec__name', 'product_spec__value']  # 设置搜索栏范围，如果有外键，要注明外键的哪个字段，双下划线
    style_fields = {'product_spec': 'm2m_transfer', 'base_product':'m2m_transfer',}
#     style_fields = {'product_spec': "radio-inline"}
#     style_fields = {'product_spec': 'checkbox-inline'}
#     style_fields = {'product_spec': 'wysi_ck'}
#     style_fields = {'product_spec': 'm2m_tree'}
      

#客户信息
class CustomerAdmin(BaseAdmin):
    list_display = ('name', 'pinyin', 'phone', 'address', 'birth', 'point', 'member_no', 'create_date', 'update_date', )
    #设置搜索框和其模糊搜索的范围
    search_fields = ['name', 'pinyin', 'phone', 'address', 'member_no',]
    #form = CustomerForm
    
        
#订单元素
class OrderItemAdmin(BaseAdmin):
    list_display = ('order', 'product', 'should_pay', 'price', 'cost', 'discount', 'point', 'number', 'create_date', 'update_date',)
    #设置搜索框和其模糊搜索的范围
    search_fields = ['order', 'product', ]
    
class OrderItemInline(object):    #StackedInline
    model = OrderItem
    extra = 0
    #style = 'accordion'
            
#订单，一次消费
class OrderAdmin(BaseAdmin):
    list_display = ('sale_code', 'customer', 'should_pay', 'pre_pay', 'actual_pay', 'had_pay', 'point', 'cost', 'discount', 'create_date', 'update_date', )
    #设置搜索框和其模糊搜索的范围 TODO order_item
    search_fields = ['sale_code', 'customer', ]
    #
    inlines = [OrderItemInline, ]
    
#
class TestAdmin(object):
    list_display = ('name', 'img',  )
    pass

xadmin.site.register(ProductSpec, ProductSpecAdmin)
xadmin.site.register(BaseProduct, BaseProductAdmin)
xadmin.site.register(Product, ProductAdmin)
xadmin.site.register(Customer, CustomerAdmin)
# xadmin.site.register(OrderItem, OrderItemAdmin)
xadmin.site.register(Order, OrderAdmin)
xadmin.site.register(Test, TestAdmin)


#自定义插件导入

from django.utils.importlib import import_module
# import_module('plugins.hello')
# import_module('plugins.formfilter')   
# import_module('plugins.productfilter')   
import_module('plugins.operatelist')
import_module('plugins.export')
import_module('plugins.fieldtrigger')   

