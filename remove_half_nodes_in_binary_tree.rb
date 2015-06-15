def remove_half_nodes_in_binary_tree(node)
  return nil if node.nil?

  node.left = remove_half_nodes_in_binary_tree(node.left);
  node.right = remove_half_nodes_in_binary_tree(node.right);

  if node.left.nil? && node.right.nil?
    return node
  end

  if node.left.nil?
    node = node.right
  end

  if node.right.nil?
    node = node.right
  end

  node
end