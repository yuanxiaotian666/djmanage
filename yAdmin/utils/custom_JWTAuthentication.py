# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/12/15 015 21:08
"""
#自定义一个权限

from rest_framework.exceptions import AuthenticationFailed, PermissionDenied, NotAuthenticated
import jwt
from rest_framework_jwt.authentication import BaseJSONWebTokenAuthentication
from rest_framework_jwt.authentication import jwt_decode_handler

from yAdmin.models import SysRoleauth, SysMenu

"""判断是否有权限
   :param path:路由
   :param methods:请求方法
"""
def Authentication(path,method):
    pathList = path.replace('/api/','').split('/')
    tableName = pathList[0]
    queryset = SysMenu.objects.filter(tableName__icontains=tableName).first()
    if queryset:
        menuId = queryset.menuId
        auth = SysRoleauth.objects.filter(menuId=menuId).first().authValue
        auth = auth+','
        authList = auth.split(',')
        if method == "GET":
            methodList = ['Search']
        elif method =="POST":
            methodList = ['Create']
        elif method =='PUT':
            methodList = ['Update']
        elif method =='DELETE':
            methodList = ['Delete']

        if set(authList)>set(methodList):
            return True
        else:
            return False
    else:
        urlFilter = ['currentTreePermission','userTreePermission','loginedUserInfo','changePwd','sidebarMenu']
        if tableName in urlFilter:
            return True
        else:
            return False

class JWTAuthentication(BaseJSONWebTokenAuthentication):
    # 自定义认证类，重写authenticate方法
    def authenticate(self, request):
        # 认证通过，返回user，auth
        # 认证失败，返回None
        auth = request.META.get('HTTP_AUTHORIZATION')  # 前台用auth携带token
        if  auth is not None:
            token = auth.replace('JWT ','')
        else:
            token = None
        try:
            payload = jwt_decode_handler(token)
            user = self.authenticate_credentials(payload)
            if user.is_staff == False:
                isAuth = Authentication(request.path,request.method)
                if isAuth==False:
                    raise jwt.InvalidTokenError('没有权限')

        # 出现jwt解析异常，直接抛出异常，代表非法用户，也可以返回None，作为游客处理
        except jwt.ExpiredSignature:
            raise AuthenticationFailed('token已过期')
        except jwt.InvalidTokenError:
            raise PermissionDenied('没有权限')
        except:
            raise AuthenticationFailed('token非法')
        return (user, auth)

