# Reverse a linked list in place
#
# Main trick is to remember to use 3 pointers

Node = Struct.new(:value, :next)

a = Node.new('a', Node.new('b', Node.new('c', Node.new('d', Node.new('e', Node.new('f'))))))

def reverse(node)
  first = node
  second = node.next
  current = node.next
  first.next = nil
  while second != nil
    second = second.next
    current.next = first
    ## iteratively setting first, current, second
    first = current
    current = second    
  end
  first
end                 
