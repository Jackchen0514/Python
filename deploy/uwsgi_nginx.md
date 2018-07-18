# uwsgi_nginx

## Flask


```
注意

请提前确保你在应用文件中的任何 app.run() 调用在 if __name__ == '__main__': 
块中或是移到一个独立的文件。这是因为它总会启动一个本地的 WSGI 服务器，并且我们在部署应用到 uWSGI 时不需要它。

```

- **用 uwsgi 启动你的应用**

uwsgi 被设计为操作在 python 模块中找到的 WSGI 可调用量。

已知在 myapp.py 中有一个 flask 应用，使用下面的命令:

```
$ uwsgi -s /tmp/uwsgi.sock --module myapp --callable app
```

或者，你喜欢这样:

```
$ uwsgi -s /tmp/uwsgi.sock -w myapp:app
```

注意：

**.sock 需要给权限

```
chmod 777 /tmp/uwsgi.sock
```

- **配置 nginx**

一个基本的 flaks uWSGI 的给 nginx 的配置看起来是这样:

```
location = /yourapplication { rewrite ^ /yourapplication/; }
location /yourapplication { try_files $uri @yourapplication; }
location @yourapplication {
  include uwsgi_params;
  uwsgi_param SCRIPT_NAME /yourapplication;
  uwsgi_modifier1 30;
  uwsgi_pass unix:/tmp/uwsgi.sock;
}
```

这个配置绑定应用到 /yourapplication 。如果你想要绑定到 URL 根会更简单，因你不许要告诉它 WSGI SCRIPT_NAME 或设置 uwsgi modifier 来使用它:

```
location / { try_files $uri @yourapplication; }
location @yourapplication {
    include uwsgi_params;
    uwsgi_pass unix:/tmp/uwsgi.sock;
}
```

## 参考

[1.uWSGI_nginx] http://docs.jinkan.org/docs/flask/deploying/uwsgi.html