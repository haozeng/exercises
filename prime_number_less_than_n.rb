# not 2, start from 0 to its square root

def find_prime_less_than_n(number)
  array = (0..number).to_a

  0..Math.sqrt(number).each do |n|
    (n**2).step(number, n) do |j|
      array.delete(j)
    end
  end
end
