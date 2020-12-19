# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/12/16 016 19:10
"""
from rest_framework import serializers

from yAdmin.models import SysRole
from yAdmin.utils.custom_viewset_base import CustomViewBase


class SysRoleSerializer(serializers.ModelSerializer):
    """角色表序列化器"""
    createDate = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)
    modifyDate = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)
    parentName = serializers.SerializerMethodField()

    def get_parentName(self, instance):
        queryset = SysRole.objects.filter(roleId=instance.parentId).first()
        if queryset:
            return queryset.roleName
        else:
            return ""


    class Meta:
        model = SysRole
        fields = '__all__'


class SysRoleViewSet(CustomViewBase):
    """
       角色接口:
       create:post新增
       update:put编辑
       list:get获取
       retrieve:get单例
       destroy:delete删除
       """
    # authentication_classes = (JWTAuthentication,)
    queryset = SysRole.objects.exclude(parentId=0).all()
    serializer_class = SysRoleSerializer