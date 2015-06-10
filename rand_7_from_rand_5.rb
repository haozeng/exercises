require 'pry'

def rand_7
  while true
    num = (rand(5) - 1)*4
    if num < 14
      return num % 7 + 1
    end
  end
end

puts rand_7
