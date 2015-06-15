# remove duplicates from an unsorted linked list

# sudo code:

# 1. initialize a hash to store value
# 2. put pointer in the first element
# 3. while pointer is not nil, we want to check if the data exists in the hash or not.
#    if it doesn't, we add the node value into hash, and put pointer into next element
#    if it does, we want to assign the previous node's next node to be the current node's next node
# 4. we finish the process until there is no node left

# with buffer
def remove_duplicate(node)
  h = Hash.new()
  c = node

  while c
    if h[c.data]
      previous = c.previous
      previous.next = c.next
    else
      h[c.data] = true
      c = c.next
    end
  end
end

# without buffer
# we have two pointers in this case, one iterates through linked list and runner checks all subsequent nodes

def remove_duplicate_without_buffer(node)
  return if node.nil?

  c = node

  while c
    n = c.next
    while n
      if n.data == c.data
        c.next = n.next
      else
        n = n.next
      end
    end
    c = c.next
  end
end