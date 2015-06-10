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

# Given a sorted (increasing order) array with unique integer elements,
# write an algorithm to create a binary search tree with minimal height.

# Sudo code:

# 1. take the middle element in the array and treat it as the middle node.
# 2. divide the left half and right half of the array
# 3. put the left half into the recursive function and it is the left branch
# 4. put the right half into the recursive function and it is the right branch


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