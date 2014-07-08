require 'pry'
require 'pp'

def binary_search(array, goal, start=0, tail=array.length)
  middle = (start + tail) / 2
  return false  if start < 0 and tail > array.length
  return false  if goal > array[-1] || goal < array[0]
  return middle if array[middle] == goal

  if goal > array[middle]
    binary_search(array, goal, middle, tail)
  else
    binary_search(array, goal, start, middle)
  end
end

pp binary_search([1,2,3,4,5], 3)
pp binary_search([1,2,3,4,5], 2)
pp binary_search([1,2,3,4,5], 5)
pp binary_search([1,2,3,4,5], 6)
pp binary_search([1,2,3,4,5,6], 3)
