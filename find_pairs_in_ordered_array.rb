require 'pp'

# Find pairs of elements in a sorted array

# sudo code:
# 1, two pointers, start left and right the same time
# 2, add the left element and right element, and it is the sum
# 3, if the sum equals the target, add two elements into the pairs
#    increate left pointer by one and decrease right pointer by one
# 4, if the sum is greater than the target, then subtract right pointer by one.
# 5, if the sum is less than the target, then add left pointer by one
# 6, print out all pairs

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