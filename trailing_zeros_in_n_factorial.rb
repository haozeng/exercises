require 'pry'


def trailing_zero_in_n_factorial(n)
  count = 0
  5.step(n, 5) do |i|
    while i%5 == 0
      i = i / 5
      count += 1
    end
  end
  puts count
end

trailing_zero_in_n_factorial(30)
