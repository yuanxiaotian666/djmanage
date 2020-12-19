# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/12/17 017 21:16
"""
from rest_framework.views import APIView

from yAdmin.ModelsViews.MenuView import SysMenuSerializer
from yAdmin.ModelsViews.RoleView import SysRoleSerializer
from yAdmin.models import SysUser, SysRole, SysMenu, SysRoleauth
from yAdmin.utils.custom_viewset_base import CustomViewBase
from yAdmin.utils.custom_json_response import JsonResponse
from rest_framework import status, serializers


class CurrentTreePermissionViewSet(CustomViewBase):
    """获取角色和菜单权限"""
    def list(self, request):
        roles = SysRoleSerializer(SysRole.objects.exclude(roleId=1).all(),many=True).data
        tree = SysMenuSerializer(SysMenu.objects.all(),many=True).data
        data = {
            "roles":roles,
            "tree":tree
        }
        return JsonResponse(data=data, code=2000, msg="获取成功", status=status.HTTP_200_OK)


class UserTreePermissionSerializer(serializers.ModelSerializer):
    """角色权限表"""
    actions = serializers.SerializerMethodField()
    def get_actions(self, instance):
        authValue = instance.authValue.split(',')
        return authValue
    id = serializers.SerializerMethodField()
    def get_id(self, instance):
        return instance.menuId
    pid = serializers.SerializerMethodField()
    def get_pid(self, instance):
        parentId = SysMenu.objects.filter(menuId=instance.menuId).first().parentId
        return parentId
    text = serializers.SerializerMethodField()
    def get_text(self, instance):
        queryset = SysMenu.objects.filter(menuId=instance.menuId).first().menuName
        return queryset
    class Meta:
        model = SysRoleauth
        fields = ('actions','text','id','pid')


class UserTreePermissionViewSet(APIView):
    """获取角色的权限"""
    def get(self,request):
        roleId = request.GET.get('roleId')
        queryset = SysRoleauth.objects.filter(roleId=roleId)
        serializer = UserTreePermissionSerializer(queryset,many=True)
        return JsonResponse(data=serializer.data, code=2000, msg="获取成功", status=status.HTTP_200_OK)

    """更新角色权限"""
    def post(self,request):
        roleId = request.data.get('roleId')
        lists = request.data.get('list')
        queryset = SysRoleauth.objects.filter(roleId=roleId)
        if queryset:
            queryset.delete()
        for li in lists:
            menuId = li.get('id')
            actions = li.get('actions')
            authValue = ",".join([action.get('value') for action in actions])
            dicts = {
                "roleId": roleId,
                "menuId": menuId,
                "authValue": authValue
            }
            SysRoleauth.objects.create(**dicts)
        return JsonResponse(data=[], code=2000, msg="保存成功", status=status.HTTP_200_OK)
