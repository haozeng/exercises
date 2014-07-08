require 'pry'
require 'pp'

# def two_number_sum(array, sum)
#   array.sort!

#   i = 0
#   j = array.size - 1
#   while i != j
#     pp [array[i], array[j]] if array[i] + array[j] == sum

#     if array[i] + array[j] > sum
#       j -= 1
#     else
#       i += 1
#     end
#   end
# end

# two_number_sum([-3, -2, 1, 0, 0, 2, 3, 4, 5], 0)

def sub_two_number_sum(array, sum)
  result = []

  i = 0
  j = array.size - 1
  while i != j
    if array[i] + array[j] == sum
      result << [array[i], array[j]]
      i += 1
      break if i == j
    end

    if array[i] + array[j] > sum
      j -= 1
    else
      i += 1
    end
  end
  return result
end

def three_number_sum(array, sum)
  array.sort!
  index = array.index(sum)
  for i in 0..index - 1
    sub_array = array.dup
    sub_array.delete array[i]
    result = sub_two_number_sum(sub_array, -array[i])
    result.each{|sub| pp sub << array[i]} if result.any?
  end
end

three_number_sum([-3, -2, 0, 1, 2, 3], 0)
# three_number_sum([-3, -2, 0, 1, 2, 3], 0)
