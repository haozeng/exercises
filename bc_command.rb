# Basic Idea: The idea is to separate the operators and integers into two arrays and
# handle their operations in the correct order. After each iteration, the size of two arrays will change
# to keep track the latest operations.

# For example, we are given 5*4/2+10, and we seperate it into integers [5,4,2,10] and operators [*, /, +]
# Step 1: 5*4 = 20, integer array became [20, 2, 10]
# Step 2: 20/2 = 10, integer array became [10, 10]
# Step 3: after the multiplicatio and division operations, operator array became [+]
# Step 4: integer array became [20], which is the expected results.

def bc(string)
  # initialize the operators and integers array
  operators = []
  integers = []

  # separate integers and operators into different arrays
  integers = string.split(/\+|\-|\*|\//).map(&:to_i)
  string.each_char do |c|
    if c.match /\+|\-|\*|\//
      operators << c
    end
  end

  # we want to handle * and / first
  count = 0
  operators.each_with_index do |o, i|
    if o.match /\*|\//
      r = integers[i-count].send(o, integers[i+1-count])
      integers.delete_at i+1-count
      integers.delete_at i-count
      integers.insert(i, r)
      count += 1
    end
  end

  # remove all * and / operators
  operators = operators.select do |o|
    !o.match /\*|\//
  end

  # we want to handle + and -
  integers.compact!
  count = 0
  operators.each_with_index do |o, i|
    if o.match /\+|\-/
      r = integers[i-count].send(o, integers[i+1-count])
      integers.delete_at i+1-count
      integers.delete_at i-count
      integers.insert(i, r)
      count += 1
    end
  end

  integers.compact
end

puts "5*4"
puts bc("5*4")
puts "5*4/2"
puts bc("5*4/2")
puts "5*4/2+10"
puts bc("5*4/2+10")
puts "100/100"
puts bc("100/100")
puts "10+10+10+10"
puts bc("10+10+10+10")
puts "10+10+10+10"
puts bc("10+10+10+10")
puts "10-10"
puts bc("10-10")
puts "10+10*10/10"
puts bc("10+10*10/10")