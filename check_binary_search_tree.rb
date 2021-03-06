require 'pry'

class Node
  attr_accessor :value, :left, :right, :name

  def initialize(options={})
    @value = options[:value]
    @name = options[:name]
    @left = options[:left]
    @right = options[:right]
  end

  def children?
    @left && @right
  end

  def no_children?
    @left.nil? && @right.nil?
  end

  def right
    @right || Node.new
  end

  def left
    @left || Node.new
  end
end

def find_binary_search_tree(node, min, max)
  return true if node.value == nil

  if node.value > max || node.value < min
    return false
  end

  find_binary_search_tree(node.left, min, node.value) && find_binary_search_tree(node.right, node.value, max)
end


n10 = Node.new({:value => 10})
n5 = Node.new({:value => 5})
n15 = Node.new({:value => 15})
n3 = Node.new({:value => 3})
n12 = Node.new({:value => 12})

n5.left = n3
n5.right = n12
n10.left = n5
n10.right = n15

puts find_binary_search_tree(n10, 0, 100)


n10 = Node.new({:value => 10})
n5 = Node.new({:value => 5})
n15 = Node.new({:value => 15})
n3 = Node.new({:value => 3})
n12 = Node.new({:value => 8})

n5.left = n3
n5.right = n12
n10.left = n5
n10.right = n15

puts find_binary_search_tree(n10, 0, 100)
