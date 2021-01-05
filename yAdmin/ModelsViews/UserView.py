# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/12/16 016 19:10
"""
from django.contrib.auth.hashers import make_password
from rest_framework import serializers
from rest_framework.views import APIView

from yAdmin.models import SysUser, SysRole
from yAdmin.utils.custom_viewset_base import CustomViewBase
from rest_framework import status
from yAdmin.utils.custom_json_response import JsonResponse


class SysUserSerializer(serializers.ModelSerializer):
    """用户表序列化器"""
    createDate = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)
    modifyDate = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", read_only=True)
    roleName = serializers.SerializerMethodField()
    def get_roleName(self, instance):
        queryset = SysRole.objects.filter(roleId=instance.roleId).first()
        if queryset:
            return queryset.roleName
        else:
            return ""

    def validate_modifier(self, modifier):
        return self.context['request'].user.username

    def validate_modifyId(self, modifyId):
        return self.context['request'].user.userId

    class Meta:
        model = SysUser
        exclude = ('password',)

    def create(self, validated_data):
        """新建"""
        validated_data['creator'] = self.context['request'].user.username
        validated_data['createId'] = self.context['request'].user.userId
        validated_data['modifier'] = self.context['request'].user.username
        validated_data['modifyId'] = self.context['request'].user.userId
        validated_data['password'] = make_password(123456)
        return SysUser.objects.create(**validated_data)



class SysUserViewSet(CustomViewBase):
    """
       菜单接口:
       create:post新增
       update:put编辑
       list:get获取
       retrieve:get单例
       destroy:delete删除
       """
    # authentication_classes = (JWTAuthentication,)
    queryset = SysUser.objects.all()
    serializer_class = SysUserSerializer
    filter_fields = ('username', 'nickName', 'roleName', 'enable', 'gender')

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance.is_staff:
            code = 1000
            msg = "超级管理员账号,无法被删除"
        else:
            self.perform_destroy(instance)
            code = 2000
            msg = "删除成功"
        return JsonResponse(data=None, code=code, msg=msg, status=status.HTTP_200_OK)



class UserInfoViewSet(APIView):
    """用户的信息接口"""
    #获取当前登录的用户信息
    def get(self,request):
        userInfo = request.user
        data = {
            "headImageUrl":userInfo.headImageUrl,
            "username":userInfo.username,
            "roleName":SysRole.objects.filter(roleId=userInfo.roleId).first().roleName,
            "nickName":userInfo.nickName,
            "gender":userInfo.gender,
            "email":userInfo.email,
            "address":userInfo.address,
            "mobile":userInfo.mobile
        }
        return JsonResponse(data=data, code=2000, msg="获取成功", status=status.HTTP_200_OK)

    """修改用户信息"""
    def post(self,request):
        username = request.data.get('username')
        SysUser.objects.filter(username=username).update(**request.data)
        return JsonResponse(data=None, code=2000, msg="修改成功", status=status.HTTP_200_OK)


class ChangePwdViewSet(APIView):
    """修改密码接口"""
    def post(self,request):
        oldPwd = request.data.get('oldPassword')
        isPwd = request.user.check_password(oldPwd)
        if isPwd:
            code=2000
            msg = "修改成功"
            newPwd = request.data.get('newPassword')
            password = make_password(newPwd)
            SysUser.objects.filter(username=str(request.user)).update(password=password)
        else:
            code = 1000
            msg = "旧密码不正确"
        return JsonResponse(data=None, code=code, msg=msg, status=status.HTTP_200_OK)

