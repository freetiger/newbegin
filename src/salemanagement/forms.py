# -*- coding: utf-8 -*-
'''
Created on 2014年12月11日

@author: heyuxing
'''
from django import forms

class CustomerForm(forms.Form):
    '''
        name = models.CharField(max_length=30, verbose_name='客户姓名' )  #名称
    pinyin = models.CharField(max_length=60, verbose_name='姓名拼音' )    #名称拼音
    phone = models.CharField(max_length=11, blank=True, verbose_name='手机号' ) #手机号码
    address = models.CharField(max_length=128, blank=True, verbose_name='联系地址' )  #地址
    birth = models.DateField(null=True, blank=True, verbose_name='出生日期' )  #出生日期
    point = models.IntegerField(default=0, verbose_name='积分' )   #积分
    member_no = models.CharField(max_length=30, blank=True, verbose_name='会员卡号' )  #会员卡号
    create_date = models.DateTimeField(auto_now_add=True, verbose_name='创建日期' )
    update_date = models.DateTimeField(auto_now=True, verbose_name='更新日期' )
    '''
    name = forms.CharField(max_length=30, label='客户姓名')
    pinyin = forms.CharField(max_length=60, label='姓名拼音')
    phone = forms.CharField(max_length=11, label='手机号', required=False)
    address = forms.CharField(max_length=128, label='联系地址', required=False)
    birth = forms.DateTimeField(label='出生日期', required=False)
    point = forms.IntegerField(label='积分', required=False, initial=1)
    member_no = forms.CharField(max_length=30, label='会员卡号', required=False)
#     subject = forms.CharField(max_length=100)
#     email = forms.EmailField(required=False, label='Your e-mail address')
#     message = forms.CharField(widget=forms.Textarea)

#     def clean_message(self):
#         message = self.cleaned_data['message']
#         num_words = len(message.split())
#         if num_words < 4:
#             raise forms.ValidationError("Not enough words!")
#         return message
#     
#     def send_email(self):
#         # 使用 self.cleaned_data 字典来发送一封邮件
#         pass