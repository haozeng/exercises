require 'pry'
require 'pp'

class Node
  attr_accessor :value, :left, :right

  def initialize(options={})
    @value = options[:value]
    @name = options[:name]
    @left = options[:left]
    @right = options[:right]
  end

  def children?
    @left && @right
  end

  def no_children?
    @left.nil? && @right.nil?
  end

  def right
    @right || Node.new
  end

  def left
    @left || Node.new
  end
end

def lca(root, p, q)
  return nil if root.value == nil
  return root if p == root || q == root

  left = lca(root.left, p, q)
  right = lca(root.right, p, q)
  return root if left && right
  left ? left : right
end


n10 = Node.new({:value => 10})
n5 = Node.new({:value => 5})
n15 = Node.new({:value => 15})
n3 = Node.new({:value => 3})
n12 = Node.new({:value => 12})
n9 = Node.new({:value => 9})
n13 = Node.new({:value => 13})

n12.left = n9
n12.right = n13
n5.left = n3
n5.right = n12
n10.left = n5
n10.right = n15

pp lca(n10, n3, n15).value
pp lca(n10, n3, n12).value
pp lca(n10, n3, n9).value
pp lca(n10, n3, n12).value
pp lca(n10, n13, n15).value


def lca_with_path(root, p, q, array=[])
  return [nil, array] if root.value == nil
  return [root, array.dup << root] if p == root || q == root

  left, array = lca_with_path(root.left, p, q, array)
  right, array = lca_with_path(root.right, p, q, array)
  return [root, array.dup << root] if left && right
  left ? [left, array.dup << left] : [right, array.dup << right]
end

pp lca_with_path(n10, n3, n15, [])[1].compact.map(&:value)
