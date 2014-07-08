# Given a data structure BiNode, that contains 2 pointers, this could be used
# to implement a binary tree or a doubly linked list.  
# Write the code to convert a binary to a doubly linked list in place and in-order

Binode = Struct.new(:left, :right, :value)


class BinodeTree
  attr_reader :root

  def initialize(value)
    @root = Binode.new(nil, nil, value)  
  end

  def leftmost_child(node)
    node.left.nil? ? node : leftmost_child(node.left)
  end
  
  def rightmost_child(node)
    node.right.nil? ? node : rightmost_child(node.right)
  end                                 
   
  def in_order_conversion(node = @root)
    return if node.nil?
    original_left = node.left
    original_right = node.right

    in_order_conversion(original_left) unless original_left.nil?
    append_to_list(node)
    in_order_conversion(original_right) unless original_right.nil?
  end

  def append_to_list(node)
    return if node.left.nil? && node.right.nil?

    unless node.left.nil?
      rightmost       = rightmost_child(node.left)
      rightmost.right = node
      node.left       = rightmost
    end

    unless node.right.nil?
      leftmost      = leftmost_child(node.right)
      leftmost.left = node
      node.right    = leftmost
    end
  end
end

tree = BinodeTree.new(4)
tree.root.left = Binode.new(Binode.new(nil,nil,1), Binode.new(nil,nil,3), 2)
tree.root.right = Binode.new(Binode.new(nil,nil,5), Binode.new(nil,nil,7), 6)
