# 递归思想每一行我看做是一个数组，传入的参数是上一个数组
# 当然每一个结果数组用temp缓存一下，每传入一个数组，那么打印一次，也就是每行的结果
class Sanjiao
  def initialize row
    @row = row
  end

  def sanjiaoxing(temp)
    # 打印出本行元素
    temp.each{ |t| print t.to_s + ' '}
    array = Array.new(temp.length + 1)
    array_max_index = array.length - 1

    # 组建下一行，即下一行数组array
    0.upto(array_max_index).each do |a|
      # 两端的就不用求
      if a == 0 || a == array_max_index
	array[a] = 1
      else
        # 根据上一个数组的结果得下一数组的值
	# to_i确保前一个数为nil时转换为0
	array[a] = temp[a-1].to_i + temp[a].to_i
      end
    end

    puts ''
    sanjiaoxing(array) if array.length < @row
  end
end

# 初始化temp的长度为1
a = Array.new(1)
a[0] = 1
s = Sanjiao.new(20)
s.sanjiaoxing(a)
