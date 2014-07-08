require 'pry'
require 'pp'

def count_ones_in_binary_format(number)
  count = 0

  while number != 0
    if number & 1 == 1
      count += 1
    end
    number = number >> 1
  end

  count
end

pp count_ones_in_binary_format(1)
pp count_ones_in_binary_format(2)
pp count_ones_in_binary_format(3)
pp count_ones_in_binary_format(4)
pp count_ones_in_binary_format(5)
