require 'pry'

# 1. numbers of multiple of itself should be removed.
# 2. only have to interate from 2 to Sqrt root of the largest number, due to step 1.
# 3. the interating number should be square of itself to avoid duplication.

def find_prime(n=100)
  array = (0..n).to_a

  (2..Math.sqrt(n)).each do |i|
    (i**2).step(n, i) do |j|
      array.delete(j)
    end
  end
  puts array
end

# 1. number less than 2, and can be divided is not a prime number.
# 2. for prime larger than 2, we want to check to see if the number can be divided by 
#    any number smaller than the square root of the target number.
#    if it can be divided by any number in that range, it is not a prime number.
# 3. otherwise, the number left is a prime number.

def prime? n
  return false if n == 2
  return false if n < 2 or n % 2 == 0

  for i in (3..Math.sqrt(n).to_i)
    return false if n % i == 0
  end
  true
end

puts find_prime(200)