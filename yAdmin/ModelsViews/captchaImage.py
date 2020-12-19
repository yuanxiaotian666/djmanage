# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/2/6 2:04
验证码的生成
"""
from django.http import HttpResponse
from captcha.views import CaptchaStore, captcha_image
from rest_framework import viewsets
from rest_framework import permissions
import base64
import json
class imageView(viewsets.ModelViewSet):
    """
    验证码获取
    """
    def perform_authentication(self, request):
        """
        重写父类的用户验证方法，不在进入视图前就检查JWT
        """
        pass

    def list(self, request, *args, **kwargs):
        hashkey = CaptchaStore.generate_key()
        try:
        #获取图片id
            id_ = CaptchaStore.objects.filter(hashkey=hashkey).first().id
            imgage = captcha_image(request, hashkey)
        #将图片转换为base64
            image_base = base64.b64encode(imgage.content)
            json_data = json.dumps({"codeId": id_, "image": "data:image/png;base64,"+image_base.decode('utf-8')})
        except:
            json_data = None
        return HttpResponse(json_data, content_type="application/json")