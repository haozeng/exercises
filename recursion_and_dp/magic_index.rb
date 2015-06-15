require 'pry'

# For non-distinct elements

[-10, -5, 2, 2, 2, 3, 4, 7, 9, 12, 13]
[0,    1, 2, 3, 4, 5, 6, 7, 8,  9, 10]

# sudo code:

# 1. find the middle value and middle index, and it is the magic index, return the index or value
# 2. search left, we want to search from start to the minimum value of (mid_value and mid_index-1)
# 3. search right, we want to search from maximum value of (mid_value and mid_index + 1)

def magic_index(array, s=0, e)
  return false if s < 0
  return false if e > array.length
  return false if s > e

  m = (s + e)/2

  mid_value = array[m]
  mid_index = m

  if mid_index == mid_value
    puts m
    return m
  end

  # search left
  right = [mid_value, mid_index-1].min
  magic_index(array, s, right)

  # search right
  left = [mid_value, mid_index+1].max
  magic_index(array, left, e)
end

magic_index([-10, -5, 2, 2, 2, 3, 4, 7, 9, 12, 13], 0, 10)