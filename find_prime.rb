require 'pry'

def find_prime(n=100)
  array = (0..n).to_a

  (2..Math.sqrt(n)).each do |i|
    (i**2).step(n, i) do |j|
      array.delete(j)
    end
  end
  puts array
end

def prime? n
  return false if n == 2
  return false if n < 2 or n % 2 == 0

  for i in (3..Math.sqrt(n).to_i)
    return false if n % i == 0
  end
  true
end

puts find_prime(200)
