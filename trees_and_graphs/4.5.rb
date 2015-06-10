class TreeNode
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

root = TreeNode.new({:value => 20, :name => 'root'})
child_1 = TreeNode.new({:value => 15, :name => 'child_1'})
child_2 = TreeNode.new({:value => 21, :name => 'child_2'})
grand_child_1 = TreeNode.new({:value => 12, :name => 'grand_child_1'})
grand_grand_child_1 = TreeNode.new({:value => 10, :name => 'grand_grand_child_1'})
grand_child_1.left = grand_grand_child_1
child_1.left = grand_child_1
root.left = child_1
root.right = child_2

def dfs(node)
  check_if_bst(node)
  node.children.each do |child|
    dfs(child)
  end
rescue
  puts 'not a bst !!'
else
  true
end

# Check if a binary tree is a binary search tree

def check_if_bst(node)
  if node.left
    unless node.left.value < node.value
      throw 'not bst' 
    end
  end

  if node.right
    unless node.right.value > node.value
      throw 'not bst' 
    end
  end
end

puts dfs(root)