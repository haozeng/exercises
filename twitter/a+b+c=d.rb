require 'pry'
require 'pp'

def a_plub_b_plub_c_equal_d(array)
  hash_left = {}

  for i in 0..array.size - 1
    for j in i+1..array.size - 1
      sum = array[i] + array[j]
      hash_left[sum] ||= []
      hash_left[sum] << [array[i], array[j]]
    end
  end

  for i in 0..array.size - 1
    for j in i+1..array.size - 1
      sum_one = array[i] - array[j]
      sum_two = array[j] - array[i]

      [sum_one, sum_two].each do |sum|
        if hash_left[sum]
          hash_left[sum].each do |a_and_b|
            tmp = a_and_b.dup
            pp tmp << array[i] << array[j] if !(a_and_b.sort & [array[i], array[j]]).any?
          end
        end
      end
    end
  end
end

array = [0,1,2,3,4,5,6,7,8,9]

a_plub_b_plub_c_equal_d(array)
