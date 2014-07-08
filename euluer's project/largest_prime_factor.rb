def largest_prime_factor(orig)
  factors = Hash.new(0)
  i = 2
  sqt = i ** 2
  n = orig

  while sqt <= n
    while n%i == 0
      n /= i
      factors[i] += 1
      puts "Found Factor #{factors[i]}"
    end
    i += 1
    sqt += i*2 + 1
  end

  if (n != 1) && (n != orig)
    factors[n] += 1
  end

  factors
end

puts largest_prime_factor(600851475143).keys.max
