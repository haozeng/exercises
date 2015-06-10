require 'pry'

class Node
  attr_accessor :value, :left, :right, :name

  def initialize(options={})
    @value = options[:value]
    @name = options[:name]
  end

  def children
    [@left, @right].compact
  end

  def children?
    @left && @right
  end

  def no_children?
    @left.nil? && @right.nil?
  end
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

# Given a directed graph, design an algorithm to find out whether there is a route
# between two nodes

# Use breadth first search
# BFS: use queue as its data structure
# 1. for each node, add the node into the queue
# 2. shift the node and check its value.
# 3. add its children node into the the queue as well

def bfs(node, a, b)
  matched = []
  queue = [node]
  while queue.size != 0
    n = queue.shift
    matched << n.value if (n.value == a || n.value == b)
    n.children.each do |child|
      queue.push(child)
    end
  end
  matched == [a, b] ? true : false
end

result = bfs(root, 1, 5)
puts result