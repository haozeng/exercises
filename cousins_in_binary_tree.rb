def check_cousins_in_a_binary_tree(node_a, node_b)
  height_a = check_height(node_a)
  height_b = check_height(node_b)

  return false if height_a != height_b
  return false if height_a.parent == height_b.parent

  true
end

def check_height(node)
  return 0 if node.nil?

  left = check_height(node.left)
  right = check_height(node.right)

  [left, right].max + 1
end