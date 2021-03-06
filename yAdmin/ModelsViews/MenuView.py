# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/12/15 015 20:23
"""
import json

from rest_framework import serializers
from rest_framework_jwt.authentication import JSONWebTokenAuthentication

from yAdmin.models import SysMenu, SysRoleauth
from yAdmin.utils.custom_JWTAuthentication import JWTAuthentication

from yAdmin.utils.custom_viewset_base import CustomViewBase


class SysMenuSerializer(serializers.ModelSerializer):
    """菜单表序列化器"""
    createDate = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)
    actions = serializers.SerializerMethodField()
    def get_actions(self, instance):
        return json.loads(instance.auth)

    def validate_modifier(self, modifier):
        return self.context['request'].user.username

    class Meta:
        model = SysMenu
        fields = "__all__"

    def create(self, validated_data):
        """新建"""
        validated_data['creator'] = self.context['request'].user
        validated_data['modifier'] = self.context['request'].user
        return SysMenu.objects.create(**validated_data)

class SysMenuViewSet(CustomViewBase):
    """
       菜单接口:
       create:post新增
       update:put编辑
       list:get获取
       retrieve:get单例
       destroy:delete删除
       """
    serializer_class = SysMenuSerializer

    def get_queryset(self):
        #获取当前登录用户的角色
        roleId = self.request.user.roleId
        #根据角色查询权限和菜单, 超级管理员权限拥有所以才到
        if roleId==1:
            return SysMenu.objects.all()
        else:
            menus = SysRoleauth.objects.filter(roleId=roleId).values('menuId')
            return SysMenu.objects.filter(menuId__in=menus).all()