# -*- coding: utf-8 -*-
'''
Created on 2014年11月26日

@author: heyuxing
'''
from django.db import models

#产品规格specification
class ProductSpec(models.Model):
    '''
    private Long productModelId;    //产品规格id
    private String productModelName;    //产品规格名称
    private String productModelValue;    //产品规格值
    private Long operatorId;    //操作者id
    private Long storeId;    //用户所在店面id
    private Date createDate;
    private Boolean enabled;    //
    '''
    name = models.CharField(max_length=64)  #规格名称
    value = models.CharField(max_length=128) #规格值
    create_date = models.DateTimeField(auto_now=True, auto_now_add=True)

    def __unicode__(self):
        return self.name
    
    class Meta:
        ordering = ['name']
        
#基础产品（如：Intel CPU，其下又可以细分不同版本型号i4，i5，i6、颜色白色，灰色。Intel CPU就是基础产品，白色i5Intel CPU就是标准产品）
class BaseProduct(models.Model):
    '''
    private Long productId;
    private String productName;
    private String productCode;
    private String  pinyin         ;    //项目名称拼音
    private String  unit ;    //单位
    private Long price          ;//单价
    private Long   point           ;//积分
    private Long  cost            ;//成本
    private Long operatorId;    //操作者id
    private Date createDate;
    private Long  storeId         ;//店面id
    private Boolean   enabled;
    '''
    name = models.CharField(max_length=30)
    code = models.CharField(max_length=50)
    pinyin = models.CharField(max_length=60)
    unit = models.CharField(max_length=30)
    country = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    website = models.URLField()

    def __unicode__(self):
        return self.name
    
    class Meta:
        ordering = ['name']
        
#标准产品（如：Intel CPU，其下又可以细分不同版本型号i4，i5，i6、颜色白色，灰色。Intel CPU就是基础产品，白色i5Intel CPU就是标准产品）
class Product(models.Model):
    '''
     //产品基本信息
    private Long productId;    //产品id
    private String productName;
    private String productCode;
    private String  productPinyin         ;    //项目名称拼音
    //产品规格信息
    private Long productDetailId;    //用户id
    private String model;    //产品规格类别、规格类别值，以JSON格式存储
    private String unit;    //单位
    private Long price;    //该类别产品价格
    private Long total;    //该类别产品剩余数目
    private Long operatorId;    //操作者id
    private Long storeId;    //用户所在店面id
    private Date createDate;
    private Boolean enabled;    //
    private SortedMap<String, String> modelMap = new TreeMap<String, String>();        //产品规格类别、规格类别值，Map格式
    '''
    name = models.CharField(max_length=30)
    address = models.CharField(max_length=50)
    city = models.CharField(max_length=60)
    state_province = models.CharField(max_length=30)
    country = models.CharField(max_length=50)
    website = models.URLField()

    def __unicode__(self):
        return self.name
    
    class Meta:
        ordering = ['name']
        
#客户信息
class Customer(models.Model):
    '''
    private Long customerId;    //客户id
    private String customerName;    //客户名称
    private String pinyin;    //客户简拼
    private String phone;    //联系电话
    private String address;    //地址
    private Long storeId;    //用户所在店面id
    private Long operatorId;    //操作者id
    private Date birth;    //
    private Long point;    //积分
    private String memberNo;    //会员卡号
    private Boolean enabled;    //
    private Date createDate;
    '''
    name = models.CharField(max_length=30)
    address = models.CharField(max_length=50)
    city = models.CharField(max_length=60)
    state_province = models.CharField(max_length=30)
    country = models.CharField(max_length=50)
    website = models.URLField()

    def __unicode__(self):
        return self.name
    
    class Meta:
        ordering = ['name']
        
#订单，一次消费
class Order(models.Model):
    '''
    private Long consumeSummaryId;    //'消费汇总id
    private String saleCode;    //销售单号
    private Long customerId;    //客户id
    private String customerName;    //客户名称
    private Long storeId;    //用户所在店面id
    private Long shouldPay;    //应付金额
    private Long prePay;    //预付金额
    private Long actualPay;    //实付金额
    private Boolean hadPay;    //完成支付
    private Long point;    //本次积分
    private Long cost;    //成本
    private Long discount;    //折扣
    private Long operatorId;    //操作者id
    private Date createDate;    //
    private Boolean enabled;    //
    '''
    name = models.CharField(max_length=30)
    address = models.CharField(max_length=50)
    city = models.CharField(max_length=60)
    state_province = models.CharField(max_length=30)
    country = models.CharField(max_length=50)
    website = models.URLField()

    def __unicode__(self):
        return self.name
    
    class Meta:
        ordering = ['name']
        
#
class OrderItem(models.Model):
    '''
    private Long consumeDetailId;    //消费明细id
    private String saleCode;    //销售单号
    private Long customerId;    //客户id
    private Long productId;    //产品id
    private String productName;    //产品名称
    private Long operatorId;    //操作者id
    private Long storeId;    //用户所在店面id
    
    private Long shouldPay;    //应付金额
    private Long cost;    //金额
    private Long price;    //单价
    private Long discount;    //折扣 TODO
    
    private Long point;    //积分 TODO
    private Long number;    //数量
    private Date createDate;
    private Boolean enabled;
    
    private String model;    //产品规格
    private Long productDetailId;    //产品明细id
    '''
    name = models.CharField(max_length=30)
    address = models.CharField(max_length=50)
    city = models.CharField(max_length=60)
    state_province = models.CharField(max_length=30)
    country = models.CharField(max_length=50)
    website = models.URLField()

    def __unicode__(self):
        return self.name
    
    class Meta:
        ordering = ['name']

