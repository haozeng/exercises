require 'pry'

def continuous_sequence(array)
  maxSum = 0
  sum = 0
  for i in 0..array.size - 1
    array[i] + sum > 0 ? sum += array[i] : sum = 0
    sum > maxSum ? maxSum = sum : nil
  end

  maxSum == 0 ? array.max : maxSum
end

pp continuous_sequence([5, -9, 5, -2, 3])

pp continuous_sequence([2,3,-8,-1,2,4,-2,3])

pp continuous_sequence([0,1,1])

pp continuous_sequence([0])

pp continuous_sequence([-1,-1,-1])


def max_slice_brute_force(array)
  (0..array.size-1).inject([array[0]]) do |max_sub, i|
    (i..array.size-1).each do |j|
      if max_sub.inject(0,:+) < array[i..j].inject(0,:+)
        max_sub = array[i..j]
      end
    end
    max_sub
  end
end

def max_slice(array)
  max = []
  cur = []
  for i in 0..array.length - 1
    cur << array[i]
    if cur.inject(:+) > max.inject(0, :+)
      max = cur.clone
    elsif cur.inject(:+) < 0
      cur = []
    end
  end
  max == [] ? [array.max] : max
end

pp max_slice([5, -9, 5, -2, 3])

pp max_slice([2,3,-8,-1,2,4,-2,3])

pp max_slice([0,1,1])

pp max_slice([0])

pp max_slice([-1,-1,-1])

pp max_slice([-5, -1, -2])

pp max_slice([-1, 2, 5, -1, 3, -2, 1])
