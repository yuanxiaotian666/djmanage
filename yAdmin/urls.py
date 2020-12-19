# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/12/10 010 10:19
"""

from django.urls import path,re_path

from yAdmin.ModelsViews.MenuView import SysMenuViewSet
from yAdmin.ModelsViews.PermissionView import CurrentTreePermissionViewSet, UserTreePermissionViewSet
from yAdmin.ModelsViews.RoleView import SysRoleViewSet
from yAdmin.ModelsViews.UserView import SysUserViewSet, UserInfoViewSet, ChangePwdViewSet
from yAdmin.ModelsViews.captchaImage import imageView

urlpatterns = [
    path('captcha/', imageView.as_view({'get': 'list'})),
    path('menu/', SysMenuViewSet.as_view({'get':'list','post':'create'})),
    re_path('menu/(?P<pk>.*?)/', SysMenuViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    path('role/', SysRoleViewSet.as_view({'get':'list','post':'create'})),
    re_path('role/(?P<pk>.*?)/', SysRoleViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    path('user/', SysUserViewSet.as_view({'get':'list','post':'create'})),
    re_path('user/(?P<pk>.*?)/', SysUserViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    path('currentTreePermission/', CurrentTreePermissionViewSet.as_view({'get':'list'})),
    re_path('userTreePermission/', UserTreePermissionViewSet.as_view()),
    path('loginedUserInfo/', UserInfoViewSet.as_view()),
    path('changePwd/',ChangePwdViewSet.as_view())
]

