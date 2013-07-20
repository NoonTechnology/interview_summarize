# encoding:utf-8
require "thread"

puts "thread synchronize by ConditionVariable"

mutex = Mutex.new
resource = ConditionVariable.new

a = Thread.new {
	mutex.synchronize {
                #
		# 这个线程目前需要resource这个资源
                # 为了让一切正常工作,等待线程必须给wait方法传递一个上锁的Mutex对象
                # 在这个线程等待过程中,这个Mutex对象会暂时解锁,而在线程唤醒后重新上锁
                #
		resource.wait(mutex)
		puts "get resource"
	}
}

b = Thread.new {
	mutex.synchronize {
		#线程b完成对resourece资源的使用并释放resource
		resource.signal
		puts "free resource"
	}
}

a.join
puts "complete"
