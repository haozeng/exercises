require 'pry'
require 'pp'

def merge_sort(array)
  return array if array.length == 1
  mid = (array.length - 1)/ 2
  left = array[0..mid]
  right = array[mid+1..array.length-1]
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  sorted = []
  while left.any? && right.any?
    left[0] < right[0] ? sorted << left.shift : sorted << right.shift
  end
  sorted + left + right
end


pp merge_sort([2,3,1,4])
pp merge_sort([2,3,1])
pp merge_sort([2,3])
pp merge_sort([2])
pp merge_sort([2,27,199,26,32,381,100])
