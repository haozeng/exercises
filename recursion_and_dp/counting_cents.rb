require 'benchmark'
require 'pry'

def count_cents(amount, demos=[25, 10, 5, 1], index=0)
  return 1 if index == 3

  demo_amount = demos[index]

  ways = 0
  start = 0

  start.step(amount, demo_amount) do |current_amount|
    remaining = amount - current_amount
    ways += count_cents(remaining, demos, index+1)
  end

  ways
end

puts Benchmark.measure {
  puts count_cents(1000)
}

@hash = {}

def count_cents_with_cache(amount, demos=[25, 10, 5, 1], index=0)
  return 1 if index == 3
  return @hash[amount][index] if @hash[amount] && @hash[amount][index]

  demo_amount = demos[index]

  ways = 0
  start = 0

  start.step(amount, demo_amount) do |current_amount|
    remaining = amount - current_amount
    ways += count_cents_with_cache(remaining, demos, index+1)
  end

  @hash[amount] ||= {}
  @hash[amount][index] = ways
 
  ways
end

puts Benchmark.measure {
  puts count_cents_with_cache(1000)
}