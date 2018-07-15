# pyenv

## 原理

pyenv 的美好之处在于，它并没有使用将不同的 $PATH 植入不同的 shell 这种高耦合的工作方式，而是简单地在 $PATH 的最前面插入了一个垫片路径（shims）：`~/.pyenv/shims:/usr/local/bin:/usr/bin:/bin`。所有对 Python 可执行文件的查找都会首先被这个 shims 路径截获，从而架空了后面的系统路径。

## 安装使用

- **自动安装**

pyenv 提供了自动安装的工具，执行命令安装即可：

```
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
```
需保证系统有 git ，否则需要新安装git工具。

- **手动安装**

将 pyenv 检出到你想安装的目录。建议路径为：$HOME/.pyenv

```
 $ cd
 $ git clone git://github.com/yyuu/pyenv.git .pyenv
```
添加环境变量。PYENV_ROOT 指向 pyenv 检出的根目录，并向 $PATH 添加 $PYENV_ROOT/bin 以提供访问 pyenv 这条命令的路径

```
 $ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
 $ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
```
这里的 shell 配置文件（~/.bash_profile）依不同 Linux 而需作修改——Zsh：~/.zshenv；Ubuntu：~/.bashrc

向 shell 添加 pyenv init 以启用 shims 和命令补完功能

```
$ echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
```
配置文件的位置同上一条一样需要修改

重启 shell（因为修改了 $PATH）

```
$ exec $SHELL
```

## pyenv常用命令

- **python配置**

    - `$ pyenv versions` -- 查看系统当前安装的python列表

    - `$ pyenv install -v 3.5.1` -- 安装python

    - `$ pyenv uninstall 2.7.3` -- 卸载python

    - `$ pyenv rehash` -- 创建垫片路径（为所有已安装的可执行文件创建 shims，如：~/.pyenv/versions/*/bin/*，因此，每当你增删了 Python 版本或带有可执行文件的包（如 pip）以后，都应该执行一次本命令）


- **python切换**

   - `$ pyenv global 3.4.0` -- 设置全局的 Python 版本，通过将版本号写入 ~/.pyenv/version 文件的方式。

   - `$ pyenv local 2.7.3` -- 设置面向程序的本地版本，通过将版本号写入当前目录下的 .python-version 文件的方式。通过这种方式设置的 Python 版本优先级较 global 高。
   - pyenv 会从当前目录开始向上逐级查找 .python-version 文件，直到根目录为止。若找不到，就用 global 版本。

   - `$ pyenv shell pypy-2.2.1` -- 设置面向 shell 的 Python 版本，通过设置当前 shell 的 PYENV_VERSION 环境变量的方式。这个版本的优先级比 local 和 global 都要高。--unset 参数可以用于取消当前 shell 设定的版本。

   - `$ pyenv shell --unset`

- **python优先级**
   
   `shell > local > global`
   
- **解决pyenv下载慢**
```
wget 下载路劲

mv xx ~/.penv/cache

cache没有的话，自行创建
```
   
## pyenv 插件: pyenv-virtualenv

- **安装**

```
git clone git://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

exec $SHELL
```

使用自动安装pyenv 后，它会自动安装部分插件，通过pyenv-virtualenv 插件可以很好的和 virtualenv 结合：

```
[root@linux3311 ~]# cd .pyenv/plugins/
[root@linux3311 plugins]# ll
insgesamt 24
drwxr-xr-x. 4 root root 4096 19. Jun 05:17 pyenv-doctor
drwxr-xr-x. 5 root root 4096 19. Jun 05:18 pyenv-installer
drwxr-xr-x. 4 root root 4096 19. Jun 05:18 pyenv-update
drwxr-xr-x. 7 root root 4096 19. Jun 05:18 pyenv-virtualenv
drwxr-xr-x. 4 root root 4096 19. Jun 05:18 pyenv-which-ext
drwxr-xr-x. 5 root root 4096 19. Jun 05:17 python-build
```

- **使用**
   


- 创建虚拟环境 `$ pyenv virtualenv 2.7.10 my-virtual-env-2.7.10`
若不指定python 版本，会汇报认使用当前环境python版本。

- 列出当前虚拟环境 `pyenv virtualenvs`

- 激活虚拟环境 `pyenv activate`

- 退出虚拟环境 `pyenv deactivate`

- 删除虚拟环境 `pyenv uninstall my-virtual-env`

使用pyenv 来管理python，使用 pyenv-virtualenv 插件来管理多版本 python包。

此时，还需注意，当我们将项目运行的 env 环境部署到生产环境时，由于我们的python 包是依赖python 的，需要注意生产环境的python版本问题
（http://pylixm.cc/posts/2016-01-18-Virtualenv-user.html）





