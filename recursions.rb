# practice
require 'benchmark'

def fibonacci(i)
  return 0 if i == 0
  return 1 if i == 1
  fibonacci(i - 1) + fibonacci(i - 2)
end


def fibonacci_with_cache(i, cache)
  return 0 if i == 0
  return 1 if i == 1
  return cache[i] if cache[i]
  cache[i] = fibonacci(i - 1) + fibonacci(i - 2)
  cache[i]
end

def fibonacci_version_two(n)
  count, a, b = 0, 0, 1
  while count < n
    a, b = b, a + b
    count += 1
  end
  b
end

# Benchmark.bm do |bm|
#   bm.report { fibonacci(10) }
#   bm.report { fibonacci_with_cache(10, Hash.new(0)) }
# end

#9.1
def count(n)
  return 0 if n < 0
  return 1 if n == 0
  count(n - 1) + count(n - 2) + count(n - 3)
end

def count_with_cache(n, cache=Hash.new(0))
  return 0 if n < 0
  return 1 if n == 0
  return cache[n] if cache[n] > 0
  cache[n] = count_with_cache(n - 1, cache) + count_with_cache(n - 2, cache) + count_with_cache(n - 3, cache)
  cache[n]
end

describe 'steps count' do
  it 'should return number of ways of counting' do
    result = count(3)
    result.should eql(4)
  end

  it 'should return number of ways of counting' do
    result = count_with_cache(3)
    result.should eql(4)
  end
end

#9.4 using combinatorics way
def count_sub_set(set)
  sub_set = []
  max = set ** 2
  max.times do |n|
    add_to_subset(n, set)
  end
  sub_set
end

def add_to_subset(n, set)
  subset = []
  n.times do |n|
    subset << ()
  end
end
