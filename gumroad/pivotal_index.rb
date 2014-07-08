require 'pp'
require 'pry'


def find_pivot(array)
  return -1 if array.size <= 2

  left = array[0]
  right = array[2..-1].inject(:+)

  for i in 1..array.size-1
    return i if left == right
    left += array[i]
    right -= array[i+1]
  end

  return -1
end

puts find_pivot([])
puts find_pivot([1])
puts find_pivot([1,2])
puts find_pivot([1,4,6,3,2])
puts find_pivot([1,4,6,3,2,0,0])
