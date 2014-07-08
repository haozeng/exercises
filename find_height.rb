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

def find_height(tree)
  return 0 if tree == nil

  return 1 + [find_height(tree.left), find_height(tree.right)].max
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

height = find_height(root)
puts height

