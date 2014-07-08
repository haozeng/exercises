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

def check_height(node)
  return 0 if node.value == nil

  left_height = check_height(node.left)
  unless check_height(node.left)
    return false
  end

  right_height = check_height(node.right)
  unless check_height(node.right)
    return false
  end

  height_diff = left_height - right_height

  if height_diff.abs > 1
    return false
  else
    return [left_height, right_height].max + 1
  end
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

puts check_height(n10)


n10 = Node.new({:value => 10})
n5 = Node.new({:value => 5})
n15 = Node.new({:value => 15})
n3 = Node.new({:value => 3})
n12 = Node.new({:value => 12})
n9 = Node.new({:value => 9})

n12.left = n9
n5.left = n3
n5.right = n12
n10.left = n5
n10.right = n15

puts check_height(n10)
