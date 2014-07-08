require 'pry'

class Stack

  attr_reader :elements

  def initialize
    @elements = []
  end

  def pop
    @elements.shift
  end

  def push(element)
    @elements.unshift(element)
  end

  def size
    @elements.size
  end
end

class Node
  attr_accessor :value, :left, :right, :name

  def initialize(options={})
    @value = options[:value]
    @name = options[:name]
    @left = options[:left] || nil
    @right = options[:right] || nil
  end

  def children?
    @left && @right
  end

  def no_children?
    !children?
  end
end

def preorder_transversal(tree)
  return if tree == nil
  puts tree.value
  preorder_transversal(tree.left)
  preorder_transversal(tree.right)
end

def preorder_transversal_non_recursion(tree)
  stack = Stack.new
  stack.push(tree)
  while stack.size > 0
    node = stack.pop
    puts node.value
    stack.push node.right if node.right
    stack.push node.left if node.left
  end
end


root = Node.new({:value => 1, :name => 'root'})
child_1 = Node.new({:value => 2, :name => 'child_1'})
child_2 = Node.new({:value => 3, :name => 'child_2'})
grand_child_1 = Node.new({:value => 4, :name => 'grand_child_1'})
grand_child_2 = Node.new({:value => 7, :name => 'grand_child_2'})
grand_child_3 = Node.new({:value => 8, :name => 'grand_child_3'})
grand_grand_child_1 = Node.new({:value => 5, :name => 'grand_grand_child_1'})
grand_grand_child_2 = Node.new({:value => 6, :name => 'grand_grand_child_2'})
grand_child_1.right = grand_grand_child_2
grand_child_1.left = grand_grand_child_1
child_1.left = grand_child_1
child_1.right = grand_child_2
child_2.right = grand_child_3
root.left = child_1
root.right = child_2

preorder_transversal(root)
preorder_transversal_non_recursion(root)
