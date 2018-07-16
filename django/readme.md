# django

## 运行报错

no moudle sqlite3

需要安装sqlite3
```
sudo apt-get install sqlite3

sqlite3 -version

sudo apt-get install libsqlite3-dev  
```

然后再重装python


## 部署

- **运行开发服务器测试**

```
python manage.py runserver
```

- **安装uwsgi**

```
pip install uwsgi
```

 - uwsgi基础测试
 
    ```
    # test.py
    def application(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    return [b"Hello World"] # python3
    #return ["Hello World"] # python2
    ```
 - 运行
 
    ```
    uwsgi --http :8000 --wsgi-file test.py
    ```
 - 浏览器查看
 
    ```
    http://127.0.0.1:8000/
    ```
    
- **测试django项目**

  ```
  uwsgi --http :8000 --module mysite.wsgi
  ```
  
  显示it works
  

- **配置nginx**
  
```
sudo vim /etc/nginx/nginx.conf
```

```
# mysite_nginx.conf

# the upstream component nginx needs to connect to
upstream django {
    # server unix:///path/to/your/mysite/mysite.sock; # for a file socket
    server 127.0.0.1:8001; # for a web port socket (we'll use this first)
}

# configuration of the server
server {
    # the port your site will be served on
    listen      8000;
    # the domain name it will serve for
    server_name example.com; # substitute your machine's IP address or FQDN
    charset     utf-8;

    # max upload size
    client_max_body_size 75M;   # adjust to taste

    # Django media
    location /media  {
        alias /path/to/your/mysite/media;  # your Django project's media files - amend as required
    }

    location /static {
        alias /path/to/your/mysite/static; # your Django project's static files - amend as required
    }

    # Finally, send all non-media requests to the Django server.
    location / {
        uwsgi_pass  django;
        include     /path/to/your/mysite/uwsgi_params; # the uwsgi_params file you installed
    }
}
```
官方例如:

```
# the upstream component nginx needs to connect to
upstream django {
    # server unix:///path/to/your/mysite/mysite.sock; # for a file socket
    server 127.0.0.1:8001; # for a web port socket (we'll use this first)
}
server {
    listen       8000;
    server_name  localhost;
    charset utf-8;

    location / {
        uwsgi_pass django;
        include  /etc/nginx/uwsgi_params;
    }
}
```
自己实践:

```
server {
    listen       8004;
    server_name  127.0.0.1;
    charset utf-8;

    location / {
      proxy_pass  http://127.0.0.1:8001;
    }
}
```

```
sudo /etc/init.d/nginx restart
sudo nginx -s reload
```

- **nginx nad uWSGI and test.py**

  ```
  uwsgi --socket :8001 --wsgi-file test.py
  ```
- **使用supervisor来管理进程**

  - 安装
  
  注意不支持python.3.x的安装，需要退出虚拟环境
  
  ```
  (sudo) pip install supervisor
  ```
  - 生成supervisor默认配置文件，比如我们放在/etc/supervisord.conf路劲中:
  
  ```
  (sudo) echo_supervisord_conf > /etc/supervisord.conf
  ```
  - 打开supervisor.conf 在最底部添加（每一行前面不要有空格，防止报错）：
  
  ```
  [program:zqxt]
  command=/path/to/uwsgi --http :8003 --chdir /path/to/zqxt --module zqxt.wsgi
  directory=/path/to/zqxt
  startsecs=0
  stopwaitsecs=0
  autostart=true
  autorestart=true
  ```
  例如：
  ```
  [program:jdango_test]
  command=uwsgi --http :8001 --chdir /home/xinsi/django/jdango_test --module jdango_test.wsgi
  directory=/home/xinsi/django/jdango_test
  startsecs=0
  stopwaitsecs=0
  autostart=true
  autorestart=true
  stopsignal=INT
    
  [supervisord]
  ```
  
  - 启动
  
  切换到虚拟环境中，然后在启动
  
  ```
  (sudo) supervisord -c /etc/supervisord.conf
  ```
  
  - 重启
  
  ```
  (sudo) supervisorctl -c /etc/supervisord.conf restart zqxt
  ```
  
  - 启动，停止，或重启 supervisor 管理的某个程序 或 所有程序：
  
  ```
  (sudo) supervisorctl -c /etc/supervisord.conf [start|stop|restart] [program-name|all]
  ```
  
## 参考

[1.uwsgi-doc] http://uwsgi-docs.readthedocs.io/en/latest/tutorials/Django_and_nginx.html#configure-nginx-for-your-site

[2.django with uWSGI] https://docs.djangoproject.com/en/dev/howto/deployment/wsgi/uwsgi/

[3.django第一周学习] https://segmentfault.com/a/1190000005171218