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

def create_binary_search_tree(array, s, e)
  if s > e
    return nil
  end
  mid = (s + e)/2
  node = Node.new(:value => array[mid])
  node.left = create_binary_search_tree(array, s, mid-1)
  node.right = create_binary_search_tree(array, mid+1, e)
  return node
end

pp create_binary_search_tree([1,2,3,4,5,6,7], 0, 6)
