require 'pp'
require 'pry'

def find_single_number(array)
  hash = array.inject({}) do |memo, value|
    memo[value] ||= 0
    memo[value] += 1
    memo
  end
  hash.select{|k,v|v == 1}
end

array = [1,2,2,3,3,4,4]
array = [1,1,2,3,3,4,4]
pp find_single_number(array)
