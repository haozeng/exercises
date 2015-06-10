require 'pry'
require 'pp'

class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def pop
    @stack.pop
  end

  def push(element)
    @stack.push(element)
  end

  def peek
    @stack[-1]
  end
end

# sudo code:

# 1. initialize two stacks, one to track all elements, the other to track the most recent lowest element
# 2. when push element, compare the top element of min_stack with element
#    if top element of min_stack is less than element, add top element to min_stack
#    otherwise add element to the min_stack
#    Also, add the element to the stack
# 3. When pop, pop the min_stack first, and pop stack and return its value
# 4. min function will be tracking the most recent element in min_stack

class MinStack
  attr_reader :min_stack, :stack

  def initialize
    @min_stack = Stack.new
    @stack = Stack.new
  end

  def push(element)
    if @min_stack.peek && @min_stack.peek < element
      @min_stack.push(@min_stack.peek)
    else
      @min_stack.push(element)
    end
    @stack.push(element)
  end

  def pop
    @min_stack.pop
    @stack.pop
  end

  def min
    @min_stack.peek
    puts "The minimun is #{@min_stack.peek}"
  end
end

min_stack = MinStack.new
min_stack.push(2)
min_stack.push(1)
min_stack.push(7)
min_stack.push(3)
min_stack.push(4)
min_stack.min

min_stack.pop
min_stack.min

min_stack.pop
min_stack.min

min_stack.pop
min_stack.min

min_stack.pop
min_stack.min