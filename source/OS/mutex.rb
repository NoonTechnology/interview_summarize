# encoding:utf-8

require "thread"

puts "Synchronize Thread"

@num=200
@mutex=Mutex.new

def buyTicket(num)
        #
        # 受@mutex保护的临界区
	# @mutex.lock
	# 	if @num>=num
	# 		@num=@num-num
	# 		puts "you have successfully bought #{num} tickets"
	# 	else
	# 		puts "sorry,no enough tickets"
	# 	end
	# @mutex.unlock
	# 
  
	# 与以上注释代码相同写法
	@mutex.synchronize do
		if @num>=num
			@num=@num-num
			puts "you have successfully bought #{num} tickets"
		else
			puts "sorry,no enough tickets"
		end
	end
end

ticket1=Thread.new 10 do
  10.times do |value|
    ticketNum=15
    buyTicket(ticketNum)
    sleep 0.01
  end
end

ticket2=Thread.new 10 do
  10.times do |value|
    ticketNum=20
    buyTicket(ticketNum)
    sleep 0.01
  end
end

sleep 1
ticket1.join
ticket2.join
