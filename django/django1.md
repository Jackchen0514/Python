# Django基本命令

## 新建一个django project

```
django-admin.py startproject project_name
特别是在 windows 上，如果报错，尝试用 django-admin 代替 django-admin.py 试试
```

## 新建 app

要先进入项目目录下，cd project_name 然后执行下面的命令（下同，已经在项目目录下则不需要 cd project_name）

```
python manage.py startapp app_name
或 django-admin.py startapp app_name
```

一般一个项目有多个app, 当然通用的app也可以在多个项目中使用。

与项目名类似 app name 也需要为合法的 Python 包名，如 blog，news, aboutus 等都是合法的 app 名称。

## 创建数据库表 或 更改数据库表或字段

```
Django 1.7.1及以上 用以下命令
# 1. 创建更改的文件
python manage.py makemigrations
# 2. 将生成的py文件应用到数据库
python manage.py migrate
 
 
旧版本的Django 1.6及以下用
python manage.py syncdb
```

