# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/2/6 17:22
"""
from rest_framework import serializers
from yAdmin.models import SysUser
from rest_framework import views
from rest_framework_jwt.serializers import jwt_encode_handler, jwt_payload_handler
from yAdmin.utils.custom_json_response import JsonResponse
from captcha.views import CaptchaStore
from datetime import datetime,timedelta

class loginViewSet(views.APIView):
    """登录接口"""
    authentication_classes = ()
    permission_classes = ()

    def post(self, request,*args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')
        codeid = request.data.get('codeId')
        captcha = request.data.get('captcha')
         
        user = SysUser.objects.filter(enable=1).filter(username=username).first()
        if user is None:
            return JsonResponse(code=1000,msg="账号未注册")
        if not user.check_password(password):  # check_password() 对明文进行加密,并验证
            return JsonResponse(code=1001,msg="密码错误")

        codeInfo = CaptchaStore.objects.filter(id=codeid).first()
        five_minute_ago = datetime.now() - timedelta(hours=0, minutes=5, seconds=0)
        if codeInfo and five_minute_ago > codeInfo.expiration:
            return JsonResponse(code=1002,msg="验证码过期")
        else:
            if codeInfo and (codeInfo.response == captcha or codeInfo.challenge == captcha):
                pass
            else:
                return JsonResponse(code=1002,msg="验证码错误")


        payload = jwt_payload_handler(user)
        token = jwt_encode_handler(payload)
        data = {
        'token': token,
        'nickname': user.nickName,
        'img':user.headImageUrl,
        'rId': user.roleId
        }
        return JsonResponse(code=2000,msg="登录成功",data=data)


#返回自定义认证
def jwt_response(token, user=None, request=None):
    data = {
        'token': token,
        'nickname': user.nickName,
        'rId':user.roleId
    }
    return data