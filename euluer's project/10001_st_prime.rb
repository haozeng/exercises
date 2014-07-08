def is_prime? number
  (2..Math.sqrt(number)).each do |i|
    if number%i == 0; return false ; end
  end
  true
end

def find_n_th_prime(n)
  count = 1
  start = 3

  while count < n
    if is_prime? start
      count += 1
    end
    start += 1
  end
  start
end

puts find_n_th_prime(10001)
