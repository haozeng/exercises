require 'pry'


def find_substrings(word)
  array = word.split('')
  result = []

  for i in 0..array.length - 1
    array.slice!(i)
    result << array
    array = word.split('')
  end
  result
end

puts find_substrings('abcd')