def thread_1
  i = 0
  while i <= 2
    puts  "Thread 1 At #{Time.now}"
    sleep(2)
    i = i + 1
  end
end

def thread_2
  j = 0
  while j <= 2
    puts  "Thread 2 At #{Time.now}"
    sleep(2)
    j = j + 1
  end
end

puts "Started At #{Time.now}"
t1 = Thread.new {thread_1}
t2 = Thread.new {thread_2}
t1.join
t2.join
puts "End At #{Time.now}"

