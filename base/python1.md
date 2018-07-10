# Python3.x基础知识


### 直接运行py文件
windows上不行，但在mac和linux上可以，在py文件第一行加上
```
#!/usr/bin/env python
```
通过命令加上可执行权限:
```
$ chmod a+x hello.py
```
接下来,可以在命令行上运行:
```
$ ./hello.py
$ hello world!
```
### 输入和输出
- 输出

```
print ('hello' , 'world')
//打印每个字符串,遇逗号输出空格,连成一行字符串
hello world
```
```
print ('100 + 200 =' , 100 + 200)
//输出
100 + 200 = 300
```
- 输入

raw_input()输入看作字符类型，返回string类型；
```
>>>name = raw_input()
chenxinsi
>>>name
'chenxinsi'
```
input()希望输入合法的python格式,即输入字符串时需要引号括起来,不然会报语法错误,
它对纯数字输入有自己的特性,输入(float int),也会返回(float int)类型

```
def input(prompt):
    return (eval(raw_input(prompt)))
```

其实input()函数也是从raw_input()实现来的

除非对 input() 有特别需要，否则一般情况下我们都是推荐使用 raw_input() 来与用户交互。
注意：python3 里 input() 默认接收到的是 str 类型。数值计算时需要强转　如int(input())
### 中文格式
```
#coding=utf-8
```
