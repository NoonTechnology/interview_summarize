* [绿色线程(Green Thread)和操作系统线程(Native Thread)](http://blog.csdn.net/perfe_ct/article/details/6704995)  
  内核线程（也叫"原生线程[native threads]"）  

* 线程和进程  
  [操作系统中的进程与线程](http://www.cnblogs.com/CareySon/archive/2012/05/04/ProcessAndThread.html)  
  Ruby中线程可查看<Ruby编程语言9.9章>  
  实现文章的LiveWriter的例子

* [进程与线程状态](http://tanteng.sinaapp.com/2011/10/state/)  
  * 就绪状态(Ready)：进程已获得除处理器外的所需资源，等待分配处理器资源；只要分配了处理器进程就可执行。就绪进程可以按多个优先级来划分队列。  
    例如，当一个进程由于时间片用完而进入就绪状态时，排人低优先级队列；当进程由I／O操作完成而进入就绪状态时，排入高优先级队列
  * 运行状态(Running)：进程占用处理器资源；处于此状态的进程的数目小于等于处理器的数目。  
    在没有其他进程可以执行时(如所有进程都在阻塞状态)，通常会自动执行系统的空闲进程  
  * 阻塞状态(Blocked)：当进程由于等待I/O操作或进程同步等条件而暂停运行时，它处于阻塞状态

* Ruby中实现线程同步
  [Link1](http://blog.csdn.net/weixingstudio/article/details/7797509)

  * 互斥(Mutual Exclusion) 每个希望访问共享数据的线程首先必须对数据加锁,锁用Mutex对象表示  
    example: source/OS/mutex.rb

  * 条件变量(Condition Variables)  
    example: source/OS/condition_variable.rb

  * 监管数据交接的Queue 当队列为空时,dep方法会阻塞  
    example: source/OS/queue.rb
