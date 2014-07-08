require 'pry'

def sum_multiples_of_three_and_five(n)
  array = []
  [3,5,15].each do |i|
    i.step(n, i) do |j|
      array << j
    end
  end
  array.uniq.inject(:+)
end

def version_two(n)
  sum = 0
  (1..n).each do |i|
    sum += i if i%3 == 0 || i%5 == 0
  end
  sum
end

puts sum_multiples_of_three_and_five(999)
puts version_two(999)
