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

class MinStack
  attr_reader :min_stack, :stack

  def initialize
    @min_stack = Stack.new
    @stack = Stack.new
  end

  def push(element)
    if @stack.peek && @stack.peek < element
      @min_stack.push(@stack.peek)
    else
      @min_stack.push(element)
    end
    @stack.push(element)
  end

  def pop
    @stack.pop
    puts "The minimun is #{@min_stack.pop}"
  end
end

min_stack = MinStack.new
min_stack.push(2)
min_stack.push(5)
