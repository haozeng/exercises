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

path = []
level = 0

def find_sum(node, sum, path, level)
  return nil if node.nil?

  path[level] = node.value

  if path.inject(0, &:+) == sum
    print "path\n"
    print "#{path}\n"
    print "level\n"
    print "#{level}\n"
  end

  find_sum(node.left, sum, path.clone, level+1)
  find_sum(node.right, sum, path.clone, level+1)
end

node_1 = TreeNode.new({:value => 1, :name => 'root'})
node_2 = TreeNode.new({:value => 2, :name => 'node_2'})
node_3 = TreeNode.new({:value => 2, :name => 'node_3'})
node_4 = TreeNode.new({:value => 3, :name => 'root_4'})
node_5 = TreeNode.new({:value => 3, :name => 'node_5'})
node_6 = TreeNode.new({:value => 2, :name => 'node_6'})
node_7 = TreeNode.new({:value => 3, :name => 'node_7'})

node_5.left = node_6
node_5.right = node_7

node_2.left = node_4
node_2.right = node_5

node_1.left = node_2
node_1.right = node_3

find_sum(node_1, 9, [], 0)
