# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/4/16 23:36
"""
from rest_framework.views import exception_handler
import json,copy

def custom_exception_handler(exc, context):
    # Call REST framework's default exception handler first,
    # to get the standard error response.
    response = exception_handler(exc, context)

    # Now add the HTTP status code to the response.
    if response is not None:
        print("错误信息",response.status_code,response.data)
        errorMsg = copy.deepcopy(response.data)
        response.data.clear()
        response.data['code'] = response.status_code
        response.data['data'] = None

        if response.status_code == 404:
            try:
                response.data['message'] = response.data.pop('detail')
                response.data['message'] = "Not found"
            except KeyError:
                response.data['message'] = "Not found"

        if response.status_code == 400:
            response.data['message'] = errorMsg

        elif response.status_code == 401:
            response.data['message'] = "登录已过期"

        elif response.status_code >= 500:
            response.data['message'] = "Internal service errors"

        elif response.status_code == 403:
            response.data['message'] = "您没有权限"

        elif response.status_code == 405:
            response.data['message'] = 'Request method error'
        response.code = response.status_code
        response.status_code = response.status_code
    return response
