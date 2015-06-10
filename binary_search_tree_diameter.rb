# sudo code:
# 1. return 0 if the node is nil
# 2. get the height and diameter from left node.
# 3. get the height and diameter from right node.
# 4. calculate height from previous step.
# 5. return the diameter and its height
require 'pry'

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

def diameter(node)
  return [0, 0] if node.nil?

  ld, lh = diameter(node.left)
  rd, rh = diameter(node.right)

  height = [lh, rh].max + 1

  [[lh + rh + 1, ld, rd].max, height]
end

root = Node.new({:value => 1, :name => 'root'})
child_1 = Node.new({:value => 2, :name => 'child_1'})
child_2 = Node.new({:value => 3, :name => 'child_2'})
grand_child_1 = Node.new({:value => 4, :name => 'grand_child_1'})
grand_grand_child_1 = Node.new({:value => 5, :name => 'grand_grand_child_1'})
grand_child_1.left = grand_grand_child_1
child_1.left = grand_child_1
root.left = child_1
root.right = child_2

height = diameter(root)
puts height