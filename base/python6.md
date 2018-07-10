# dict和set
### dict
- 概念：

Python内置了字典：dict的支持，dict全称dictionary，在其他语言中也称为map，使用键-值（key-value）存储，具有极快的查找速度。
```
>>> d = {'Michael':95, 'Bob':75, 'Tracy':85}
>>> d['Michael']
95
```
- 添加/修改数据
```
>>> d['chenxinsi'] = 100
>>> d
{'Michael': 88, 'Bob':75, 'chenxinsi': 100, 'Tracy': 85}
```
- 获取数据

```
>>> d.get('chenxinsi')
100
>>> d['chenxinsi']
100
```
- 判断key存不存在

如果key不存在的话,会报错
```
d['chenxinsi']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'chenxinsi'
```
通过key判断
```
>>> 'chenxinsi' in d
False
```
另一种获取数据方式get(),如果key不存在,则可以返回None，也可以返回默认value
```
>>> print(d.get('chenxinsi'))
None
>>> d.get('chenxinsi',-1)
-1
```
- 删除数据

用pop()方法,如果key存在,返回对应value
```
>>> d.pop('chenxinsi')
11
```
如果key不存在，会报错
```
>>> d.pop('chenxinsi')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'chenxinsi'
```
如果key不存在，有默认值，则返回默认值
```
>>> d.pop('chenxinsi',-1)
-1
```
### set
- 概念

set和dict类似，也是一组key的集合，但不存储value。
是一种无序无重复的集合
- 过滤重复
```
>>> s = set([1, 1, 2, 2, 3, 3])
>>> s
{1, 2, 3}
```
- 添加元素

通过add(key)方法可以添加元素到set中，可以重复添加，但不会有效果：
```
>>> s.add(4)
>>> s
{1, 2, 3, 4}
>>> s.add(4)
>>> s
{1, 2, 3, 4}
```
- 删除元素

通过remove(key)方法可以删除元素：
```
>>> s.remove(4)
>>> s
{1, 2, 3}
```
- 交集／并集

set可以看成数学意义上的无序和无重复元素的集合，因此，两个set可以做数学意义上的交集、并集等操作：
```
>>> s1 = set([1, 2, 3])
>>> s2 = set([2, 3, 4])
>>> s1 & s2
{2, 3}
>>> s1 | s2
{1, 2, 3, 4}
```

