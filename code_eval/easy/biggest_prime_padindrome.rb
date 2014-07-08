def prime? n
  return false if n == 2
  return false if n < 2 or n % 2 == 0

  for i in (3..Math.sqrt(n).to_i)
    return false if n % i == 0
  end
  true
end

def padindrome? n
  string = n.to_s
  string == string.reverse
end

number = nil
for i in (3..1000)
  if prime?(i) && padindrome?(i)
    number = i
  end
end

puts number
