# -*- coding: utf-8 -*-

"""
@author: 猿小天

@contact: QQ:1638245306

@Created on: 2020/4/16 23:35
"""
from rest_framework import viewsets
from rest_framework import status
from yAdmin.utils.custom_json_response import JsonResponse
from rest_framework import filters
from django_filters import rest_framework


class CustomViewBase(viewsets.ModelViewSet):
    queryset = ''
    serializer_class = ''
    permission_classes = ()
    filter_backends = (rest_framework.DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter,)
    filter_fields = ()
    search_fields = ()


    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return JsonResponse(data=serializer.data, msg="新增成功", code=2000,
                            status=status.HTTP_200_OK, headers=headers)

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
            # result = self.get_paginated_response(serializer.data)
            # print(51,result.data)
            # return JsonResponse(code=2000,msg="获取成功", data=result.data)
        serializer = self.get_serializer(queryset, many=True)
        return JsonResponse(data=serializer.data, code=2000, msg="获取成功", status=status.HTTP_200_OK)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        return JsonResponse(data=serializer.data, code=2000, msg="获取成功", status=status.HTTP_200_OK)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return JsonResponse(data=serializer.data, msg="更新成功", code=2000, status=status.HTTP_200_OK)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return JsonResponse(data=[], code=2000, msg="删除成功", status=status.HTTP_200_OK)
