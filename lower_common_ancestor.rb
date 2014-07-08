require 'pry'

class Node
  attr_accessor :value, :left, :right, :name

  def initialize(options={})
    @value = options[:value]
    @name = options[:name] || nil
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

# Binary search tree

def lowest_common_ancestor(node, a, b)
  if node.value < a && node.value < b
    lowest_common_ancestor(node.right, a, b)
  elsif node.value > a && node.value > b
    lowest_common_ancestor(node.left, a, b)
  else
    return node.value
  end
end

def lowest_common_ancestor_iteratively(node, a, b)
  while node != nil
    if node.value < a && node.value < b
      node = node.right
    elsif node.value > a && node.value > b
      node = node.left
    else
      return node.value
    end
  end
end

n20 = Node.new({:value => 20})
n8 = Node.new({:value => 8})
n22 = Node.new({:value => 22})
n4 = Node.new({:value => 4})
n12 = Node.new({:value => 12})
n10 = Node.new({:value => 10})
n14 = Node.new({:value => 14})

n12.left = n10
n12.right = n14
n8.left = n4
n8.right = n12
n20.left = n8
n20.right = n22

puts lowest_common_ancestor(n20, 4, 8)
puts lowest_common_ancestor_iteratively(n20, 4, 8)
