# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/4/16 23:35
"""
from rest_framework.pagination import PageNumberPagination, LimitOffsetPagination
from collections import OrderedDict
from rest_framework.response import Response
from yAdmin.utils.custom_json_response import JsonResponse

class LargeResultsSetPagination(LimitOffsetPagination):
    page_size = 10
    page_size_query_param = 'page'
    max_page_size = 100
    limit_query_param = 'limit'

    def get_paginated_response(self, data):
        code = 2000
        msg = 'success'
        if not data:
            code = 404
            msg = "Data Not Found"

        return Response(OrderedDict([
            ('code', code),
            ('message', msg),
            ('total',self.count),
            ('data', data),
        ]))
