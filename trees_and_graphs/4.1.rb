require 'pry'

class Node
  attr_accessor :value, :left, :right, :name

  def initialize(options={})
    @value = options[:value]
    @left = options[:left]
    @right = options[:right]
    @name = options[:name]
  end

  def children?
    @left || @right
  end

  def no_children?
    !children?
  end

  def left
    @left || nil
  end

  def right
    @right || nil
  end
end

def check_height(node)
  return 0 if node.no_children?

  left_height = node.left ? check_height(node.left) : 0
  right_height = node.right ? check_height(node.right) : 0

  if (left_height - right_height).abs > 1
    return false
  else
    return [left_height, right_height].max + 1
  end
end

root = Node.new({:value => 1, :name => 'root'})
child_1 = Node.new({:value => 2, :name => 'child_1'})
child_2 = Node.new({:value => 3, :name => 'child_2'})
grand_child_1 = Node.new({:value => 4, :name => 'grand_child_1'})
child_1.left = grand_child_1
root.left = child_1
root.right = child_2

height = check_height(root)
puts height



root = Node.new({:value => 1, :name => 'root'})
child_1 = Node.new({:value => 2, :name => 'child_1'})
child_2 = Node.new({:value => 3, :name => 'child_2'})
grand_child_1 = Node.new({:value => 4, :name => 'grand_child_1'})
grand_grand_child_1 = Node.new({:value => 5, :name => 'grand_grand_child_1'})
grand_child_1.left = grand_grand_child_1
child_1.left = grand_child_1
root.left = child_1
root.right = child_2
# puts root.inspect

height = check_height(root)
puts height

