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

def check_complete_binary_search_tree(node)
  return 0 if node.nil?

  left = check_complete_binary_search_tree(node.left)
  right = check_complete_binary_search_tree(node.right)

  return false unless left && right
  return false if (left - right).abs > 1

  [left, right].max + 1
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

puts check_complete_binary_search_tree(root)