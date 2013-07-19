* [ruby面试题+笔试题](http://www.mianwww.com/html/category/it-interview/ruby)
* [ruby笔试题](http://www.jobui.com/mianshiti/it/ruby/?n=1)
* Ruby中的对象模型  ???
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
 判断klass是否是obj的类，或者obj类的超类，或者obj类被mixin的模块
 * obj.is_a? (klass)  ->  true or false  
 和kind_of? 一样
 * obj.instance_of? (klass)  ->  true of false  
 判断obj是否是由klass生成的实例

* Ruby主要数据结构以及特点
  * Set  
  Set实现了由若干个无序且不重复的对象所组成的集合的功能。它既包含Array的运算功能,同时又兼有Hash的高速搜索功能。
  * Array  
  数组的元素可以是任意的Ruby对象
  * Hash  
  通过哈希表,您可以将一个任意类型的对象同另一个任意类型的对象联系起来

* Ruby文件操作
  * File.new
  * File.open
  * file.puts #写入内容
  * Dir['/home/simlegate'].each {|x|p x}  #查找目录下所有文件及文件夹

* Ruby优缺点  
  * 优点:
    1. Ruby是解释型语言，其程序无需编译即可执行  
    2. 语法简单、优雅  
    3. 完全面向对象.Ruby从一开始就被设计成纯粹的面向对象语言，因此所有东西都是对象，例如整数等基本数据类型  
    4. 跨平台和高度可移植性.Ruby支持多种平台，在Windows, Unix, Linux, MacOS上都可以运行。Ruby程序的可移植性非常好，绝大多数程序可以不加修改的在各种平台上加以运行
    5. 拥有很多高级特性.Ruby拥有很多高级特性，例如操作符重载、Mix-ins、特殊方法等等，是用这些特性可以方便地完成各种强大的功能
  * 缺点：
    1. 解释型语言，所以速度较慢

* [gets和gets.chomp(去掉每一个元素尾部的换行符)的区别](http://chita.blog.51cto.com/2536781/717737)
  * gets在取得输入的值后自动加上'\n'换行符
  * gets.chomp则反之

* ruby实现华氏到摄氏的转换
  二者间的换算公式如下：  
  1.摄氏℃ =5／9 ×（°F－32）  
  例如，将华氏90度换算成摄氏度数  
  5／9 ×（90－ 32）= 5／9 × 58= 32.2  
  即：华氏90度等于摄氏32.2度。  
  2.华氏°F=℃ × 9／5＋32  
  例如，将摄氏30度换算成华氏度数 
  30×9／5＋32=54＋32=86  
  即：摄氏30度等干华氏86度。  

  代码：source/Ruby面试题/CelsiusToFahrenheit.rb

* puts,p,print的区别
  * puts 输出内容后，会自动换行(如果内容参数为空，则仅输出一个换行符号)；另外如果内容参数中有转义符，输出时将先处理转义再输出
  * p 基本与puts相同，但不会处理参数中的转义符号
  * print 基本与puts相同，但输出内容后，不会自动在结尾加上换行符

* [Ruby方法访问权限](http://blog.csdn.net/magneto7/article/details/9150445)
  * **public**       可以被任何实例对象调用，不存在访问控制；
  * **protected**    可以被定义它的类和其子类访问，可以在类中或子类中指定给实例对象； ????
  * **private**      可以被定义它的类和其子类访问，不能被实例对象调用。
  方法默认都是公有的（initialize方法除外，它永远是私有的）

  代码：source/Ruby面试题/方法访问权限.rb

* Ruby 的所有时间对象都可像数字一样用在值域中。Date和DateTime对象按天递增，而Time对象按秒递增
* Ruby单件方法和单件类(单件的别名特殊)

* [File.open和File.new的区别](http://blog.csdn.net/zl728/article/details/4994718)
  * File.open后不接代码块和File.new效果一样
  * 反之,File.open在发生异常时会自动关闭file
  * 反之,File.open返回的结果为代码块的值
