# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class SysCity(models.Model):
    city_id = models.IntegerField(db_column='CityId')  # Field name made lowercase.
    citycode = models.CharField(db_column='CityCode', max_length=20, blank=True, null=True)  # Field name made lowercase.
    cityname = models.CharField(db_column='CityName', max_length=30, blank=True, null=True)  # Field name made lowercase.
    provincecode = models.CharField(db_column='ProvinceCode', max_length=20, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_city'


class SysDictionary(models.Model):
    dic_id = models.AutoField(db_column='Dic_ID', primary_key=True)  # Field name made lowercase.
    config = models.CharField(db_column='Config', max_length=4000, blank=True, null=True)  # Field name made lowercase.
    createdate = models.DateTimeField(db_column='CreateDate', blank=True, null=True)  # Field name made lowercase.
    createid = models.IntegerField(db_column='CreateID', blank=True, null=True)  # Field name made lowercase.
    creator = models.CharField(db_column='Creator', max_length=30, blank=True, null=True)  # Field name made lowercase.
    dbserver = models.CharField(db_column='DBServer', max_length=4000, blank=True, null=True)  # Field name made lowercase.
    dbsql = models.CharField(db_column='DbSql', max_length=4000, blank=True, null=True)  # Field name made lowercase.
    dicname = models.CharField(db_column='DicName', max_length=100)  # Field name made lowercase.
    dicno = models.CharField(db_column='DicNo', max_length=100)  # Field name made lowercase.
    enable = models.IntegerField(db_column='Enable')  # Field name made lowercase.
    modifier = models.CharField(db_column='Modifier', max_length=30, blank=True, null=True)  # Field name made lowercase.
    modifydate = models.DateTimeField(db_column='ModifyDate', blank=True, null=True)  # Field name made lowercase.
    modifyid = models.IntegerField(db_column='ModifyID', blank=True, null=True)  # Field name made lowercase.
    orderno = models.IntegerField(db_column='OrderNo', blank=True, null=True)  # Field name made lowercase.
    parentid = models.IntegerField(db_column='ParentId')  # Field name made lowercase.
    remark = models.CharField(db_column='Remark', max_length=2000, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_dictionary'


class SysDictionarylist(models.Model):
    diclist_id = models.AutoField(db_column='DicList_ID', primary_key=True)  # Field name made lowercase.
    createdate = models.DateTimeField(db_column='CreateDate', blank=True, null=True)  # Field name made lowercase.
    createid = models.IntegerField(db_column='CreateID', blank=True, null=True)  # Field name made lowercase.
    creator = models.CharField(db_column='Creator', max_length=30, blank=True, null=True)  # Field name made lowercase.
    dicname = models.CharField(db_column='DicName', max_length=100, blank=True, null=True)  # Field name made lowercase.
    dicvalue = models.CharField(db_column='DicValue', max_length=100, blank=True, null=True)  # Field name made lowercase.
    dic_id = models.IntegerField(db_column='Dic_ID', blank=True, null=True)  # Field name made lowercase.
    enable = models.IntegerField(db_column='Enable', blank=True, null=True)  # Field name made lowercase.
    modifier = models.CharField(db_column='Modifier', max_length=30, blank=True, null=True)  # Field name made lowercase.
    modifydate = models.DateTimeField(db_column='ModifyDate', blank=True, null=True)  # Field name made lowercase.
    modifyid = models.IntegerField(db_column='ModifyID', blank=True, null=True)  # Field name made lowercase.
    orderno = models.IntegerField(db_column='OrderNo', blank=True, null=True)  # Field name made lowercase.
    remark = models.CharField(db_column='Remark', max_length=2000, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_dictionarylist'


class SysLog(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    begindate = models.DateTimeField(db_column='BeginDate', blank=True, null=True)  # Field name made lowercase.
    browsertype = models.CharField(db_column='BrowserType', max_length=200, blank=True, null=True)  # Field name made lowercase.
    elapsedtime = models.IntegerField(db_column='ElapsedTime', blank=True, null=True)  # Field name made lowercase.
    enddate = models.DateTimeField(db_column='EndDate', blank=True, null=True)  # Field name made lowercase.
    exceptioninfo = models.TextField(db_column='ExceptionInfo', blank=True, null=True)  # Field name made lowercase.
    logtype = models.CharField(db_column='LogType', max_length=50, blank=True, null=True)  # Field name made lowercase.
    requestparameter = models.TextField(db_column='RequestParameter', blank=True, null=True)  # Field name made lowercase.
    responseparameter = models.TextField(db_column='ResponseParameter', blank=True, null=True)  # Field name made lowercase.
    role_id = models.IntegerField(db_column='Role_Id', blank=True, null=True)  # Field name made lowercase.
    serviceip = models.CharField(db_column='ServiceIP', max_length=100, blank=True, null=True)  # Field name made lowercase.
    success = models.IntegerField(db_column='Success', blank=True, null=True)  # Field name made lowercase.
    url = models.CharField(db_column='Url', max_length=4000, blank=True, null=True)  # Field name made lowercase.
    userip = models.CharField(db_column='UserIP', max_length=100, blank=True, null=True)  # Field name made lowercase.
    username = models.CharField(db_column='UserName', max_length=4000, blank=True, null=True)  # Field name made lowercase.
    user_id = models.IntegerField(db_column='User_Id', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_log'


class SysMenu(models.Model):
    menuId = models.AutoField(db_column='Menu_Id', primary_key=True)  # Field name made lowercase.
    menuName = models.CharField(db_column='MenuName', max_length=50)  # Field name made lowercase.
    auth = models.CharField(db_column='Auth', max_length=4000, blank=True, null=True)  # Field name made lowercase.
    icon = models.CharField(db_column='Icon', max_length=50, blank=True, null=True)  # Field name made lowercase.
    description = models.CharField(db_column='Description', max_length=200, blank=True, null=True)  # Field name made lowercase.
    enable = models.IntegerField(db_column='Enable', blank=True, null=True)  # Field name made lowercase.
    orderNo = models.IntegerField(db_column='OrderNo', blank=True, null=True)  # Field name made lowercase.
    tableName = models.CharField(db_column='TableName', max_length=200, blank=True, null=True)  # Field name made lowercase.
    parentId = models.IntegerField(db_column='ParentId')  # Field name made lowercase.
    url = models.CharField(db_column='Url', max_length=4000, blank=True, null=True)  # Field name made lowercase.
    createDate = models.DateTimeField(db_column='CreateDate', blank=True, null=True,auto_now_add=True)  # Field name made lowercase.
    creator = models.CharField(db_column='Creator', max_length=50, blank=True, null=True)  # Field name made lowercase.
    modifyDate = models.DateTimeField(db_column='ModifyDate', blank=True, null=True,auto_now=True)  # Field name made lowercase.
    modifier = models.CharField(db_column='Modifier', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_menu'


class SysProvince(models.Model):
    province_id = models.AutoField(db_column='ProvinceId', primary_key=True)  # Field name made lowercase.
    provincecode = models.CharField(db_column='ProvinceCode', max_length=20)  # Field name made lowercase.
    provincename = models.CharField(db_column='ProvinceName', max_length=30)  # Field name made lowercase.
    regioncode = models.CharField(db_column='RegionCode', max_length=20, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_province'


class SysRole(models.Model):
    roleId = models.AutoField(db_column='Role_Id', primary_key=True)  # Field name made lowercase.
    createDate = models.DateTimeField(db_column='CreateDate', blank=True, null=True,auto_now_add=True)  # Field name made lowercase.
    creator = models.CharField(db_column='Creator', max_length=50, blank=True, null=True)  # Field name made lowercase.
    deleteBy = models.CharField(db_column='DeleteBy', max_length=50, blank=True, null=True)  # Field name made lowercase.
    deptName = models.CharField(db_column='DeptName', max_length=50, blank=True, null=True)  # Field name made lowercase.
    deptId = models.IntegerField(db_column='Dept_Id', blank=True, null=True)  # Field name made lowercase.
    enable = models.IntegerField(db_column='Enable', blank=True, null=True)  # Field name made lowercase.
    modifier = models.CharField(db_column='Modifier', max_length=50, blank=True, null=True)  # Field name made lowercase.
    modifyDate = models.DateTimeField(db_column='ModifyDate', blank=True, null=True,auto_now=True)  # Field name made lowercase.
    orderNo = models.IntegerField(db_column='OrderNo', blank=True, null=True)  # Field name made lowercase.
    parentId = models.IntegerField(db_column='ParentId')  # Field name made lowercase.
    roleName = models.CharField(db_column='RoleName', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_role'


class SysRoleauth(models.Model):
    authId = models.AutoField(db_column='Auth_Id', primary_key=True)  # Field name made lowercase.
    authValue = models.CharField(db_column='AuthValue', max_length=1000)  # Field name made lowercase.
    createDate = models.DateTimeField(db_column='CreateDate', blank=True, null=True,auto_now_add=True)  # Field name made lowercase.
    creator = models.CharField(db_column='Creator', max_length=1000, blank=True, null=True)  # Field name made lowercase.
    menuId = models.IntegerField(db_column='Menu_Id')  # Field name made lowercase.
    modifier = models.CharField(db_column='Modifier', max_length=1000, blank=True, null=True)  # Field name made lowercase.
    modifyDate = models.DateTimeField(db_column='ModifyDate', blank=True, null=True,auto_now=True)  # Field name made lowercase.
    roleId = models.IntegerField(db_column='Role_Id', blank=True, null=True)  # Field name made lowercase.
    userId = models.IntegerField(db_column='User_Id', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_roleauth'


class SysRoleauthdata(models.Model):
    authId = models.IntegerField(db_column='Auth_Id', primary_key=True)  # Field name made lowercase.
    datatypeId = models.IntegerField(db_column='DataType_Id', blank=True, null=True)  # Field name made lowercase.
    roleId = models.IntegerField(db_column='Role_Id', blank=True, null=True)  # Field name made lowercase.
    userId = models.IntegerField(db_column='User_Id', blank=True, null=True)  # Field name made lowercase.
    nodeId = models.CharField(db_column='Node_Id', max_length=50, blank=True, null=True)  # Field name made lowercase.
    levelId = models.IntegerField(db_column='LevelID', blank=True, null=True)  # Field name made lowercase.
    authValue = models.CharField(db_column='AuthValue', max_length=4000, blank=True, null=True)  # Field name made lowercase.
    creator = models.CharField(db_column='Creator', max_length=50, blank=True, null=True)  # Field name made lowercase.
    createDate = models.DateTimeField(db_column='CreateDate', blank=True, null=True,auto_now_add=True)  # Field name made lowercase.
    modifier = models.CharField(db_column='Modifier', max_length=50, blank=True, null=True)  # Field name made lowercase.
    modifyDate = models.DateTimeField(db_column='ModifyDate', blank=True, null=True,auto_now=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_roleauthdata'

from django.contrib.auth.models import AbstractUser
class SysUser(AbstractUser):
    userId = models.AutoField(db_column='User_Id', primary_key=True)  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=200, blank=True, null=True)  # Field name made lowercase.
    apptype = models.IntegerField(db_column='AppType', blank=True, null=True)  # Field name made lowercase.
    auditDate = models.DateTimeField(db_column='AuditDate', blank=True, null=True)  # Field name made lowercase.
    auditStatus = models.IntegerField(db_column='AuditStatus', blank=True, null=True)  # Field name made lowercase.
    auditor = models.CharField(db_column='Auditor', max_length=200, blank=True, null=True)  # Field name made lowercase.
    createDate = models.DateTimeField(db_column='CreateDate', blank=True, null=True,auto_now_add=True)  # Field name made lowercase.
    createId = models.IntegerField(db_column='CreateID', blank=True, null=True)  # Field name made lowercase.
    creator = models.CharField(db_column='Creator', max_length=200, blank=True, null=True)  # Field name made lowercase.
    deptName = models.CharField(db_column='DeptName', max_length=150, blank=True, null=True)  # Field name made lowercase.
    deptId = models.IntegerField(db_column='Dept_Id', blank=True, null=True)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=100, blank=True, null=True)  # Field name made lowercase.
    enable = models.IntegerField(db_column='Enable',default=0)  # Field name made lowercase.
    gender = models.IntegerField(db_column='Gender', blank=True, null=True)  # Field name made lowercase.
    headImageUrl = models.CharField(db_column='HeadImageUrl', max_length=200, blank=True, null=True)  # Field name made lowercase.
    isRegregisterPhone = models.IntegerField(db_column='IsRegregisterPhone',default=0)  # Field name made lowercase.
    lastLoginDate = models.DateTimeField(db_column='LastLoginDate', blank=True, null=True)  # Field name made lowercase.
    lastModifyPwdDate = models.DateTimeField(db_column='LastModifyPwdDate', blank=True, null=True)  # Field name made lowercase.
    mobile = models.CharField(db_column='Mobile', max_length=100, blank=True, null=True)  # Field name made lowercase.
    modifier = models.CharField(db_column='Modifier', max_length=200, blank=True, null=True)  # Field name made lowercase.
    modifyDate = models.DateTimeField(db_column='ModifyDate', blank=True, null=True,auto_now=True)  # Field name made lowercase.
    modifyId = models.IntegerField(db_column='ModifyID', blank=True, null=True)  # Field name made lowercase.
    orderNo = models.IntegerField(db_column='OrderNo', blank=True, null=True)  # Field name made lowercase.
    roleId = models.IntegerField(db_column='Role_Id', default=0)  # Field name made lowercase.
    roleName = models.CharField(db_column='RoleName', max_length=150)  # Field name made lowercase.
    phoneNo = models.CharField(db_column='PhoneNo', max_length=11, blank=True, null=True)  # Field name made lowercase.
    remark = models.CharField(db_column='Remark', max_length=200, blank=True, null=True)  # Field name made lowercase.
    tel = models.CharField(db_column='Tel', max_length=20, blank=True, null=True)  # Field name made lowercase.
    nickName = models.CharField(db_column='UserTrueName', max_length=20)  # Field name made lowercase.
    username = models.CharField(db_column='Username', max_length=255, blank=True, null=True,
                                unique=True)  # Field name made lowercase.
    password = models.CharField(db_column='Password', max_length=255, blank=True,
                                null=True)  # Field name made lowercase.
    token = models.CharField(db_column='Token', max_length=500, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'sys_user'
