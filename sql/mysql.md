# MySql

## adding the mysql apt repository

```
shell> sudo dpkg -i /PATH/version-specific-package-name.deb
```

for example:

```
shell> sudo dpkg -i mysql-apt-config_w.x.y-z_all.deb
```

```
shell> sudo apt-get update
```

## Installing MySql with APT

```
shell> sudo apt-get install mysql-server
```

## Starting and Stopping the MySql Server

```
shell> sudo service mysql status
```

```
shell> sudo service mysql stop
```

```
shell> sudo service mysql start
```

## mysql基本使用

输入账号密码进入：
```
mysql -u root -p
Enter password:
```

## 安装Python-mysql

- **安装pip**

```
$ sudo apt-get install python-pip python-dev build-essential 
$ sudo pip install --upgrade pip 
$ sudo pip install --upgrade virtualenv 
```

- **安装pip3**

```
sudo apt-get install python3-pip
```

检查是否安装成功

```
pip3 --version
```

由于python3.x没有MysqlDB,所以有个替代品pymysql

```
pip3 install wheel
pip3 install pymysql
```

## mysql允许远程连接


将host字段的值改为%就表示在任何客户端机器上能以root用户登录到mysql服务器，建议在开发时设为%。

```
mysql> use mysql;
Database changed
mysql> grant all privileges  on *.* to root@'%' identified by "xxxxxxx密码";
Query OK, 0 rows affected (0.00 sec)
```

## 参考

[mysql安装及配置](https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/)

[python3.x下pycharm连接mysql](https://www.cnblogs.com/python-nameless/p/6986984.html)

[pymysql使用](https://www.cnblogs.com/W-Kr/p/5456810.html)