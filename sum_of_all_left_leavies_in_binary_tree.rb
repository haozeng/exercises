require 'pry'

class Node
  attr_accessor :value, :left, :right, :name, :parent

  def initialize(options={})
    @value = options[:value]
    @name = options[:name]
    @left = options[:left] || nil
    @right = options[:right] || nil
  end

  def children?
    @left && @right
  end

  def left=(left)
    @left = left
    @left.parent = self
  end

  def right=(right)
    @right = right
    @right.parent = self
  end

  def no_children?
    !children?
  end
end


def sum_of_all_left_leavies_in_binary_tree(node)
  queue = [node]
  value = 0

  while queue.any?
    e = queue.pop
    value += e.value if e.parent && e == e.parent.left && !e.left
    queue << e.left if e.left
    queue << e.right if e.right
  end

  value
end

root = Node.new({:value => 20, :name => 'root'})
child_1 = Node.new({:value => 9, :name => 'child_1'})
child_2 = Node.new({:value => 49, :name => 'child_2'})
grand_child_1 = Node.new({:value => 5, :name => 'grand_child_1'})
grand_child_2 = Node.new({:value => 12, :name => 'grand_child_1'})
grand_child_3 = Node.new({:value => 23, :name => 'grand_child_1'})
grand_child_4 = Node.new({:value => 52, :name => 'grand_child_1'})
great_grand_child_5 = Node.new({:value => 15, :name => 'grand_child_1'})
great_grand_child_6 = Node.new({:value => 50, :name => 'grand_child_1'})
child_1.left = grand_child_1
child_1.right = grand_child_2
child_2.left = grand_child_3
child_2.right = grand_child_4
root.left = child_1
root.right = child_2
grand_child_2.right = great_grand_child_5
grand_child_4.left = great_grand_child_6

puts sum_of_all_left_leavies_in_binary_tree(root)