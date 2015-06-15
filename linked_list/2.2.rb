# interatively

def find_last_kth_element(node, k)
  p1 = node
  p2 = node

  for i in 1..k
    return if p2.nil?
    p2 = p2.next
  end

  return if p2.nil?

  while p2.next
    p1 = p1.next
    p2 = p2.next
  end
  p1
end

# recursively
def find_last_k_recursively(node, k)
  return 0 if node.nil?

  i = find_last_k_recursively(node.next, k) + 1

  puts node.data if i == k

  return i
end


