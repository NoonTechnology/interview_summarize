
# ruby 多线程

Ruby的多线程是用户级多线程，这样使得Ruby的多线程移植非常容易
Thread类由Ruby解释器具体实现，提供了一种同时处理多个任务的方法， Thread类实现的并不是操作系统级多线程。
你并不需关心具体的操作系统；这样做也使线程容易控制，程序不容易产生死锁这类严重的线程问题。

但是同时，由于Ruby的多线程并不是真正意义上的操作系统级多线程，不管代码使用了多少个Thread类的实例，
都只会在启动解释器这一个进程内执行
由Ruby解释器进行具体的线程切换管理，其效率要低于由操作系统管理线程的效率，且不能使用多个CPU。

在Ruby中同时做多件事最简单的方式就是使用Thread类，Thread类提供了一种高效和轻量级的手段来同时处理多件任务。

# 优缺点
Ruby多线程的优点和缺点同样明显，
缺点是效率不如操作系统级多线程，不能使用多个CPU，
但其优点也很明显，即可移植性很高。这就需要设计人员综合考虑。


# 实现
可以使用Thread.new方法去创建一个线程，可以随后代码块中列出线程执行的代码：

```ruby
x = Thread.new { sleep 0.1; print “x”; print “y”; print “z” }
a = Thread.new { print “a”; print “b”; sleep 0.2; print “c” }
```

执行结果为：
```ruby
ab
```

上面的示例程序中使用Thread.new创建了二个线程，线程随即开始运行。
但是运行结果很奇怪，为什么程序运行结果是“ab”呢？我们预期的执行结果应该是 “abxyzc”。

当Ruby程序执行完毕的时候，他会杀掉所有的线程，不管其它的线程的运行状态如何。
如果没有使用join方法，那么主程序执行完毕后会把所有没有执行完毕的线程杀掉。
上面的实例程序中，当主程序运行完毕时，两个线程都没有运行结束就被中止掉了。
我们可以使用join方法来让主程序等待某个特定线程结束，对每一个线程使用join方法，可以确保在程序结束前所有的线程可以运行完毕。

```ruby
x = Thread.new { sleep 0.1; print “x”; print “y”; print “z” }
a = Thread.new { print “a”; print “b”; sleep 0.2; print “c” }
x.join
a.join
```
我们使用Thread.new方法创建两个新的线程并开始运行, 然后使用join方法等待线程结束。执行结果为：
```ruby
abxyzc
```
可以看到通过使用join方法等待线程结束，程序运行结果和我们预期结果相符。

另一个例子：
```ruby
x = Thread.new { sleep 0.1; print “x”; print “y”; print “z” }
a = Thread.new { sleep 0.1; print “a”; print “b”; sleep 0.2; print “c” }
```
执行没有任何输出，因为主程序执行完毕杀死两个线程的时候这两个线程没有运行到输出语句。

也可以给join方法添加时间用来指明最大等待时间。如果超时join返回nil。
```ruby
x = Thread.new { sleep 0.1; print “x”; print “y”; print “z” }
a = Thread.new { sleep 0.1; print “a”; print “b”; sleep 10; print “c” }

x.join(5)
a.join(5)
```
 执行结果为：

 abxyz

 上面的例子中对于每一个线程的最大等待时间是5秒，由于a线程需要执行10秒以上，所以a线程没有运行完毕程序就将返回。