# -*- coding: utf-8 -*-
'''
Created on 2014年11月26日

@author: heyuxing
'''
from django.db import models
from django import forms
from salemanagement.forms import CustomerForm

#产品规格specification
class ProductSpec(models.Model):
    name = models.CharField(max_length=64, verbose_name='规格名称' )  #规格名称
    value = models.CharField(max_length=128, verbose_name='规格值' ) #规格值
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='创建日期' )
    update_date = models.DateTimeField(auto_now=True, verbose_name='更新日期' )

    def __unicode__(self):
        return self.name+":"+self.value
    
    class Meta:
        ordering = ['-update_date']
        verbose_name='产品规格' 
        verbose_name_plural='产品规格' 
        
#基础产品（如：Intel CPU，其下又可以细分不同版本型号i4，i5，i6、颜色白色，灰色。Intel CPU就是基础产品，白色i5Intel CPU就是标准产品）
class BaseProduct(models.Model):
    name = models.CharField(max_length=30, verbose_name='产品名称' )  #名称
    code = models.CharField(max_length=50, null=True, blank=True, verbose_name='产品编码' )  #编码
    pinyin = models.CharField(max_length=60, null=True, blank=True, verbose_name='产品拼音' )    #名称拼音
    #以下各个销售产品可以有不同的值
    unit = models.CharField(max_length=30, default="件", verbose_name='单位' )      #计数单位
    price = models.DecimalField(max_digits=8, decimal_places=2, null=True, blank=True, verbose_name='价格' )    #单价 #max_digits：数字允许的最大位数；decimal_places：小数的最大位数
    cost = models.DecimalField(max_digits=8, decimal_places=2, null=True, blank=True, verbose_name='成本' )  #成本
    point = models.IntegerField(default=0, verbose_name='积分' )   #积分
    #
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='创建日期' )
    update_date = models.DateTimeField(auto_now=True, verbose_name='更新日期' )

    def __unicode__(self):
        return self.name
    
    class Meta:
        ordering = ['-update_date']
        verbose_name='基础产品' 
        verbose_name_plural='基础产品' 
        
#销售产品（如：Intel CPU，其下又可以细分不同版本型号i4，i5，i6、颜色白色，灰色。Intel CPU就是基础产品，白色i5Intel CPU就是销售产品）
class Product(models.Model):
    base_product = models.ForeignKey(BaseProduct, verbose_name='基础产品' )   #TODO 如何易用
    product_spec = models.ManyToManyField(ProductSpec, blank=True, verbose_name='产品规格' )   #TODO 如何易用 , style_fields=['m2m_transfer' , ]
    #以下各个销售产品可以有不同的值
    unit = models.CharField(max_length=30, default="件", verbose_name='单位' )      #计数单位
    price = models.DecimalField(max_digits=8, decimal_places=2, verbose_name='价格' )    #单价 #max_digits：数字允许的最大位数；decimal_places：小数的最大位数
    cost = models.DecimalField(max_digits=8, decimal_places=2, verbose_name='成本' )  #成本
    point = models.IntegerField(default=0, verbose_name='积分' )   #积分
    #
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='创建日期' )
    update_date = models.DateTimeField(auto_now=True, verbose_name='更新日期' )
    
    
    
    def __unicode__(self):
        productShow = " "
        for item in self.product_spec.select_related():
            productShow+=str(item)+" "
        return str(self.base_product)+productShow
    
    class Meta:
        ordering = ['-update_date']
        verbose_name='销售产品' 
        verbose_name_plural='销售产品' 
        
#客户信息
class Customer(models.Model):
    name = models.CharField(max_length=30, verbose_name='客户姓名' )  #名称
    pinyin = models.CharField(max_length=60, blank=True, verbose_name='姓名拼音' )    #名称拼音
    phone = models.CharField(max_length=11, blank=True, verbose_name='手机号' ) #手机号码
    address = models.CharField(max_length=128, blank=True, verbose_name='联系地址' )  #地址
    birth = models.DateField(null=True, blank=True, verbose_name='出生日期' )  #出生日期
    point = models.IntegerField(default=0, verbose_name='积分' )   #积分
    member_no = models.CharField(max_length=30, blank=True, verbose_name='会员卡号' )  #会员卡号
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='创建日期' )
    update_date = models.DateTimeField(auto_now=True, verbose_name='更新日期' )
    forms.model = CustomerForm

    def __unicode__(self):
        return self.name
    
    class Meta:
        ordering = ['-update_date']
        verbose_name='客户' 
        verbose_name_plural='客户信息' 
        
#订单，一次消费
class Order(models.Model):
    sale_code = models.CharField(max_length=50, blank=True, verbose_name='订单号' ) #销售单号
    customer = models.ForeignKey(Customer)  #客户
    should_pay = models.DecimalField(max_digits=8, decimal_places=2, default="0.00", verbose_name='应付金额' )  #应付金额
    pre_pay = models.DecimalField(max_digits=8, decimal_places=2, default="0.00", verbose_name='预付金额' )  #预付金额
    actual_pay = models.DecimalField(max_digits=8, decimal_places=2, default="0.00", verbose_name='实付金额' )  #实付金额
    had_pay = models.BooleanField(default=False, verbose_name='完成支付' ) #是否已完成支付
    point = models.IntegerField(default=0, verbose_name='积分' )   #积分
    cost = models.DecimalField(max_digits=8, decimal_places=2, default="0.00", verbose_name='成本' )  #成本
    discount = models.IntegerField(default=100, verbose_name='折扣' )  #折扣 100制
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='创建日期' )
    update_date = models.DateTimeField(auto_now=True, verbose_name='更新日期' )
    
    def __unicode__(self):
        return self.sale_code
    
    class Meta:
        ordering = ['-sale_code']
        verbose_name='订单' 
        verbose_name_plural='订单' 
        
#订单元素
class OrderItem(models.Model):
    order = models.ForeignKey(Order)    #订单
    product = models.ForeignKey(Product)    #产品
    #
    should_pay = models.DecimalField(max_digits=8, decimal_places=2, default="0.00", verbose_name='应付金额' )  #应付金额
    price = models.DecimalField(max_digits=8, decimal_places=2, default="0.00", verbose_name='价格' )    #单价 #max_digits：数字允许的最大位数；decimal_places：小数的最大位数
    cost = models.DecimalField(max_digits=8, decimal_places=2, default="0.00", verbose_name='成本' )  #成本
    discount = models.IntegerField(default=100, verbose_name='折扣' )  #折扣 100制
    point = models.IntegerField(default=0, verbose_name='积分' )   #积分
    number = models.IntegerField(default=1, verbose_name='数量' )   #数量
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='创建日期' )
    update_date = models.DateTimeField(auto_now=True, verbose_name='更新日期' )

    def __unicode__(self):
        return str(self.product)
    
    class Meta:
        ordering = ['-update_date']
        verbose_name='订单元素' 
        verbose_name_plural='订单元素' 
        
class Test(models.Model):
    name = models.CharField(max_length=30)
    password = models.CharField(max_length=30)
    GENDER_CHOICE = (
        (u'M', u'Male'),
        (u'F', u'Female'),
    )
    gender = models.CharField(max_length=2,choices = GENDER_CHOICE)
    birthday = models.DateField(null=True)
    img = models.ImageField(upload_to='photo',null=True,blank=True)
    phoneNum = models.CharField(max_length=13,null=True,blank=True)
    email = models.EmailField(null=True,blank=True)
    hobbies = models.CharField(max_length=100,null=True,blank=True)
    regTime = models.DateTimeField(null=True,blank=True)
    bio = models.TextField(null = True,blank=True)
    
    def __unicode__(self):
        return self.name

