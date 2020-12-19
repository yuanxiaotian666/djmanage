# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/12/15 015 20:23
"""
import json

from rest_framework import serializers
from rest_framework_jwt.authentication import JSONWebTokenAuthentication

from yAdmin.models import SysMenu
from yAdmin.utils.custom_JWTAuthentication import JWTAuthentication

from yAdmin.utils.custom_viewset_base import CustomViewBase


class SysMenuSerializer(serializers.ModelSerializer):
    """菜单表序列化器"""
    createDate = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)
    actions = serializers.SerializerMethodField()
    def get_actions(self, instance):
        return json.loads(instance.auth)

    class Meta:
        model = SysMenu
        fields = "__all__"

class SysMenuViewSet(CustomViewBase):
    """
       菜单接口:
       create:post新增
       update:put编辑
       list:get获取
       retrieve:get单例
       destroy:delete删除
       """
    # authentication_classes = (JWTAuthentication,)
    queryset = SysMenu.objects.all()
    serializer_class = SysMenuSerializer