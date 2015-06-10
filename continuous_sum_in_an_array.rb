require 'pp'
require 'pry'

# Given a = [0, 1, 3, 20, 10, 4] and 33, find [3, 20, 10]
#       b = [-5, 2, -10, -20, 30, 2, 4] and 0, find [-10, -20, 30]

# sudo code:

# 1, initialize a current sum, and initialize the sum with the first element
# 2, start iterate the array from second element
# 3, if the sum equals to target, print it out and return from the function.
# 4, and add the current element into the sum
# 5, if the sume is larger than the target, remove the first element from the sum until it is less than the sum.

def find_sequence(array, target)
  cur = [array[0]]

  for i in 1..array.length-1
    if cur.inject(:+) == target
      pp cur
      return true
    end

    cur << array[i]

    while cur.inject(:+) > target
      cur = cur[1..-1]
    end
  end
end

a = [0, 1, 3, 20, 10, 4]
b = [-5, 2, -10, -20, 30, 2, 4]

def find_sequence_brute_force_negative(array, target)
  cur = []

  for i in 0..array.length-1
    cur = [array[i]]
    for j in i+1..array.length-1
      cur << array[j]
      pp cur if cur.inject(0, :+) == target
    end
  end
end

pp find_sequence(a, 33)
# find_sequence_brute_force_negative(b, 0)
