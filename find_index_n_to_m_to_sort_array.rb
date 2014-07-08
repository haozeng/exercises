require 'pry'

def find_index(array)
  left_index = nil
  right_index = nil

  for i in 0..array.length - 1
    left_index = i and break if array[i] > array[i + 1]
  end

  (array.length - 1).downto(1) do |j|
    right_index = j and break if array[j - 1] > array[j]
  end
  middle = array[left_index + 1..right_index - 1]
  min = middle.min
  max = middle.max

  m = nil
  n = nil
  (left_index).downto(0) do |i|
    m = i and break if min >= array[i]
  end

  (right_index).upto(array.length-1) do |j|
    n = j - 1 and break if max <= array[j]
  end

  puts m, n
end


find_index([1,2,4,7,10,11,7,12,6,7,16,18,19])
