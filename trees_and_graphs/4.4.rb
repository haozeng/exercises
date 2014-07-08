Node = Struct.new(:value, :next)

class List
  attr_accessor :head, :length

  def initialize(value)
    @head = Node.new(value, nil)
    @length = 1
  end

  def append(value)
    old_head = @head
    @head = Node.new(value, old_head)
  end
end


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

def bfs_linked_list(node)
  linked_list_array = []
  current = [node]
  while current.size > 0
    new_current = current.map do |child|
      child.children
    end    
    linked_list_array << create_linked_list(current)
    current = new_current.flatten
  end

  linked_list_array
end

def create_linked_list(nodes)
  list = List.new(nodes.pop.value)
  while nodes.size >= 1
    list.append(nodes.pop.value)
  end
  list
end

root = TreeNode.new({:value => 1, :name => 'root'})
child_1 = TreeNode.new({:value => 2, :name => 'child_1'})
child_2 = TreeNode.new({:value => 3, :name => 'child_2'})
grand_child_1 = TreeNode.new({:value => 4, :name => 'grand_child_1'})
grand_grand_child_1 = TreeNode.new({:value => 5, :name => 'grand_grand_child_1'})
grand_child_1.left = grand_grand_child_1
child_1.left = grand_child_1
root.left = child_1
root.right = child_2

# puts bfs_linked_list(root)[0].inspect
# puts bfs_linked_list(root)[1].inspect
# puts bfs_linked_list(root)[2].inspect
puts bfs_linked_list(root).inspect