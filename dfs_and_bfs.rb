class Node
  attr_accessor :key , :children
  def initialize(key)
    @key=key
    @children=[]
    @parent=nil
  end

  def add_child(node)
    @children << node
  end
end

# DFS : Depth First Search

def dfs(node)
 return node.key if node.children.size ==0
 node.children.each do |nod|
  puts nod.key
  dfs(nod)
 end
end

# BFS : Breadth First Search
def bfs(nod)
 queue=[nod]
 while(queue.size != 0)
  a_node=queue.shift
  puts a_node.key
  a_node.children.each do |nod|
   queue << nod
  end
 end
end


@root=Node.new("ROOT")
@child_a=Node.new("A")
@child_b=Node.new("B")
@child_c=Node.new("C")

@child_a_d=Node.new("AD")
@child_a_e=Node.new("AE")
@child_b_f=Node.new("BF")

@child_a.add_child(@child_a_d)
@child_a.add_child(@child_a_e)
@child_b.add_child(@child_b_f)

@root.add_child(@child_a)
@root.add_child(@child_b)
@root.add_child(@child_c)

dfs(@root)
bfs(@root)
