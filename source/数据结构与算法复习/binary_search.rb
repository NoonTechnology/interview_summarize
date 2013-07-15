# 有序列表，元素按*升序*排列(递归实现)
#   params array 被查找的数列
#   params key   需要查找的元素
#   return 索引
#   被查找的数列或者被分割后数列的开始位置
#   被查找的数列或者被分割后数列的结束位置
def binary_search(array, key, low=0, high=array.size-1)
  # 没有找到该元素则返回-1
  return -1 if low > high

  # 找到数组中间元素索引
  mid = (low + high) / 2

  # 找到该元素并返回该元素在数组中的索引
  return mid if array[mid] == key

  # 如果中间位置记录的关键字大于查找关键字，则进一步查找前一子表
  if array[mid] > key
    high = mid - 1
  else
    low = mid + 1
  end
  binary_search(array, key, low, high)
end

ary = [1,2,3,4,5,6,7,8,9]
puts binary_search(ary, 8)

# 采用循环的实现
def cycle_binary_search(array, key)
  low = 0
  high = array.size - 1

  while low > high
    mid = (low + high) / 2
    return mid if array[mid] == key

    if array[mid] > key
      high = mid - 1
    else
      low = mid + 1
    end
  end

  # 没有找到该元素
  return -1
end

ary = [1,2,3,4,5,6,7,8,9]
puts binary_search(ary, 8)

# 降序列表不适合以上算法
# ary = [1,2,3,4,5,6,7,8,9].reverse
# puts binary_search(ary, 8)
