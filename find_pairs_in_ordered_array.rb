require 'pp'

def find_pairs(array, target)
  left = 0
  right = array.size - 1
  pairs = []

  while left < right
    sum = array[left] + array[right]
    if sum == target
      pairs << [array[left], array[right]]
      left += 1
      right -= 1
    elsif sum > target
      right -= 1
    else
      left += 1
    end
  end
  pp pairs
  puts pairs.inspect
end



find_pairs([-2, -1, 0, 3, 5, 6, 7, 9, 13, 14], 12)
