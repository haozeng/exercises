require 'pry'

def rand_7
  while true
    num = rand(5) * 5 + rand(5)
    if num < 21
      return num % 7
    end
  end
end

puts rand_7
