def partition_a_link_via_a_number(x)
  left = LinkedList.new
  right = LinkedList.new

  c = x

  while c
    if c.data > x
      if left
        left.next = x
      else
        left = x
      end
    else
      if right
        right.next = x
      else
        right = x
      end
    end
    c = c.next
  end

  left.next = right
  left
end