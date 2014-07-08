require 'pp'
require 'pry'

# Array, not efficient, O(n^2)

def find_k_biggest_number(array, k)
  numbers = []

  array.each do |element|
    numbers << element if numbers.size < k
    if element > numbers.min
      numbers.delete(numbers.min)
      numbers.push(element)
    end
  end

  numbers
end

a = [2,3,4,6,7,2,1,11,10]
# pp find_k_biggest_number(a, 2)


# Max-Heap, O(n) + k*O(log(n))
require 'pqueue'

def find_k_biggest_number_using_heap(array, k)
  max_heap = PQueue.new(array){ |a, b| a > b }
  k.times.inject([]){|memo, value| memo << max_heap.pop; memo }
end

a = [2,3,4,6,7,2,1,11,10]
pp find_k_biggest_number_using_heap(a, 2)
