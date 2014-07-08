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

def create_BST(array)
  mid = (array.length - 1)/2
  tree = Node.new({:value => array[mid]})

  if array.length > 1
    left = array[0..mid-1]
    right = array[mid+1..array.length-1]
    tree.left = create_BST(left)
    tree.right = create_BST(right)
  end
  tree
end

array = [1,2,3,4,5,6,7]
puts create_BST(array).inspect