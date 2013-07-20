# encoding: utf-8
require "thread"

puts "SizedQuee Test"

queue = Queue.new

producer = Thread.new do
	10.times do |i|
		sleep rand(i) # 让线程睡眠一段时间
		queue.enq i
		puts "#{i} produced"
	end
end

consumer = Thread.new do
	10.times do |i|
	        # 当queue为空时,consumer阻塞,直到queue有值,才被唤醒
		value = queue.deq
		sleep rand(i/2)
		puts "consumed #{value}"
	end
end

consumer.join
