class TreeNode
  attr_accessor :value, :left, :right, :name, :parent

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

  def left=(node)
    @left = node
    node.parent = self
  end

  def right=(node)
    @right = node
    node.parent = self
  end
end

# Find next node in a BSF using in-order tranverse
# http://en.wikipedia.org/wiki/Tree_traversal#In-order_.28symmetric.29

# sudo code:

# 1. if node right exists, then move pointer to node right
#    recursively search node left is node left exist and move pointer to node left
#    return the current pointer.
# 2. if node right does not exist
#    while node is the parent's node right node, keep move the pointer to the parent
#    return the current pointer.

def find_next_node(node)
  if node.right
    node = node.right
    while node.left
      node = node.left
    end
    return node
  else
    while node.parent.right == node
      node = node.parent
    end
    return node.parent
  end
end

# root = TreeNode.new({:value => 20, :name => 'root'})
# child_1 = TreeNode.new({:value => 15, :name => 'child_1'})
# child_2 = TreeNode.new({:value => 21, :name => 'child_2'})
# grand_child_1 = TreeNode.new({:value => 12, :name => 'grand_child_1'})
# grand_grand_child_1 = TreeNode.new({:value => 10, :name => 'grand_grand_child_1'})
# grand_child_1.left = grand_grand_child_1
# child_1.left = grand_child_1
# root.left = child_1
# root.right = child_2

# puts find_next_node(grand_child_1).value
# puts find_next_node(grand_grand_child_1).value
# puts find_next_node(child_1).value

node_1 = TreeNode.new({:value => 20, :name => 'root'})
node_2 = TreeNode.new({:value => 8, :name => 'node_2'})
node_3 = TreeNode.new({:value => 22, :name => 'node_3'})
node_4 = TreeNode.new({:value => 4, :name => 'root_4'})
node_5 = TreeNode.new({:value => 12, :name => 'node_5'})
node_6 = TreeNode.new({:value => 10, :name => 'node_6'})
node_7 = TreeNode.new({:value => 14, :name => 'node_7'})

node_5.left = node_6
node_5.right = node_7

node_2.left = node_4
node_2.right = node_5

node_1.left = node_2
node_1.right = node_3

# puts find_next_node(node_6).value
# puts find_next_node(node_7).value
# puts find_next_node(node_4).value
puts find_next_node(node_2).value