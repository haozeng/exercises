# Implement a singly linked list

Node = Struct.new(:next, :value)

class LinkedList
  attr_reader :head

  def initialize(value)
    @head = Node.new(nil, value)
  end

  def search(value)
    current = @head
    while (!current.nil?) 
      return current if current.value == value
      current = current.next
    end
    nil
  end
  
  def insert(value)
    old_head = @head
    @head = Node.new(old_head, value)
  end

  def delete_node(node)
    previous_to_node = @head
    if previous_to_node == node
      @head = head.next  
      return previous_to_node
    end

    while (!previous_to_node.next.nil?) 
      if previous_to_node.next == node
        old_node = node
        previous_to_node.next = previous_to_node.next.next
        return old_node
      end
      previous_to_node = previous_to_node.next
    end
    
    nil
  end

  def delete(value)
    node_to_delete = search(value)
    delete_node(node_to_delete)
  end

end
