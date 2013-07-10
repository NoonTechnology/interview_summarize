* [ruby面试题+笔试题](http://www.mianwww.com/html/category/it-interview/ruby)
* Ruby中类和模块的区别
  * 模块和类的区别在于，模块不能实例化，类不能include

* [Ruby中的字符串与符号](http://blog.csdn.net/besfanfei/article/details/7966987)
  * 字符串和符号，都是Ruby中表示文本的方式
  * 相同的符号是一个对象，相同的字符并不一定是一个对象
  * 处理符号相比字符串，占用更少的资源  
    由于字符串变量必须具有各种修改其内容的功能，所以字符串的维护和处理的开销就很大

* [==, ===, equal?, eql? 的区别](http://darkbaby123.iteye.com/blog/604678)
  * obj == other_obj  ->  true or false  
  在Object类层面，这个方法是判断obj和 other_obj是不是同一个对象（可以理解为两者的object_id一定要相同）。但通常子类都会重写 == 方法来加入自己的比较逻辑。虽然每个子类都对此有不同的实现，但常见的作用就是比较两个对象的值是否相同。
  * obj === other_obj  ->  true or false  
  主要用于case语句中的比较。效果和 == 一样，但一般会被子类重写，来适应case语句的需要。很典型的就是正则表达式的 === 方法。
  * obj.equal? (other_obj)  ->  true or false  
  判断obj和other_obj的object_id是否相同。子类不会重写这个方法。所以它的效果在任何对象中都是一样的
  * obj.eql? (other_obj)  ->  true or false   
  判断obj和other_obj的值是否相同。和 == 差不多，但有些细微区别，比如Numeric类型，1.eql?(1.0) 是返回 false 的，因为两者类型不同，而 == 则会做类型转换再比较。

* [Array#to_a, Array#to_ary 的区别](http://darkbaby123.iteye.com/blog/604678)
  * arr.to_ary   ->  ary  
  这个方法很简单，直接返回方法调用者。返回值和原对象没有区别。
  * arr.to_a   ->  arr  
  这个方法复杂一点。首先，当arr是Array的实例时，直接返回arr；当arr是Array子类的实例时，会先使用 to_ary 获得一个数组，然后根据这个数组创建一个新数组（就是复制）返回。

* [kind_of?, is_a?, instance_of? 的区别](http://darkbaby123.iteye.com/blog/604678)
 * obj.kind_of? (klass)  ->  true or false  
 判断klass是否是obj的类，或者超类，或者被mixin的模块
 * obj.is_a? (klass)  ->  true or false  
 和kind_of? 一样
 * obj.instance_of? (klass)  ->  true of false  
 判断obj是否是由klass生成的实例

