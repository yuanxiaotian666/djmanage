"""djManage URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import path, include,re_path
from rest_framework.documentation import include_docs_urls
from yAdmin.ModelsViews.login import loginViewSet
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token
from django.views.generic.base import TemplateView
urlpatterns = [
    re_path(r'docs/', include_docs_urls(title='接口文档')),
    path('login/', loginViewSet.as_view()),
    path('refreshToken/',refresh_jwt_token),
    path('api/', include('yAdmin.urls')),
    re_path(r'', TemplateView.as_view(template_name='index.html')),
]
