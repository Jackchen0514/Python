# 使用list和tuple
### list
Python内置的一种数据类型是列表：list
list是一种有序的集合，可以随时添加和删除其中的元素
```
>>> classmates = ['Michael', 'Bob', 'Tracy']
>>> classmates
['Michael', 'Bob', 'Tracy']
```
变量classmates就是一个list。用len()函数可以获得list元素的个数：
```
>>> len(classmates)
3
```
用索引来反问list中每一个位置的元素，索引都是从0开始的：
```
>>> classmates[0]
'Michael'
```
如果要去最后一个元素，可以用-1做索引
```
>>> classmates[-1]
'Tracy'
```
list是一个可变的有序表，所以可以往list中追加元素到末尾：
```
>>> classmates.append('Adam')
['Michael', 'Bob', 'Tracy', 'Adam']
```
也可以把元素插入到指定的位置
```
>>> classmates.insert(1, 'Jack')
>>> classmates
['Michael', 'Jack', 'Bob', 'Tracy', 'Adam']
```
要删除list末尾的元素，用pop()方法：
```
>>> classmates.pop()
'Adam'
>>> classmates
['Michael', 'Jack', 'Bob', 'Tracy']
```
要删除指定位置的元素，用pop(i)方法，其中i是索引
```
>>> classmates.pop(1)
'Jack'
>>> classmates
['Michael', 'Bob', 'Tracy']
```
要把某个元素替换成别的元素，可以直接赋值给对应的索引位置
```
>>> classmates[1] = 'Sarah'
>>> classmates
['Michael', 'Sarah', 'Tracy']
```
list里面的元素的数据类型也可以不同：
```
>>> L = ['Apple', 123, True]
```
list元素也可以是另一个list：
```
>>> s = ['python', 'java', ['asp', 'php'], 'scheme']
>>> len(s)
4
```
如果一个list中一个元素也没有，就是一个空的list，它的长度为0：
```
>>> L = []
>>> len(L)
0
```
### tuple
另一种有序列表叫元组,但是是不可变的

如果要定义一个空的tuple，可以写成()：
```
>>> t = ()
>>> t
()
```
只有1个元素的tuple定义时必须加一个逗号,，来消除歧义：
```
>>> t = (1,)
>>> t
(1,)
```
最后来看一个“可变的”tuple：
```
>>> t = ('a', 'b', ['A', 'B'])
>>> t[2][0] = 'X'
>>> t[2][1] = 'Y'
>>> t
('a', 'b', ['X', 'Y'])
```
表面上看，tuple的元素确实变了，但其实变的不是tuple的元素，而是list的元素。tuple一开始指向的list并没有改成别的list，所以，tuple所谓的“不变”是说，tuple的每个元素，指向永远不变。即指向'a'，就不能改成指向'b'，指向一个list，就不能改成指向其他对象，但指向的这个list本身是可变的！
