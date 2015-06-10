require 'pry'

def in_order_transverse(node)
  stack = []
  current = node

  while stack.any? || !current.nil?
    while current != nil
      stack.push(current)
      current = current.left
    end

    current = stack.pop
    puts current.value
    current = current.right
  end
end

Node = Struct.new(:left, :right, :value)

node4 = Node.new(nil, nil, 4)
node5 = Node.new(nil, nil, 5)
node2 = Node.new(node4, node5, 2)
node3 = Node.new(nil, nil, 3)
node1 = Node.new(node2, node3, 1)

# in_order_transverse(node1)

def pre_order_transverse(node)
  stack = []
  stack.push(node)

  while stack.any?
    element = stack.pop
    puts element.value
    stack.push(element.right) if element.right
    stack.push(element.left) if element.left
  end
end

# pre_order_transverse(node1)

# To do
def post_order_transverse(node)
  stack_one = []
  stack_two = []
  stack_one.push(node)

  while stack_one.any?
    element = stack_one.pop
    stack_two.push(element)
    stack_one.push(element.left) if element.left
    stack_one.push(element.right) if element.right
  end
  stack_two.map(&:value).reverse
end

pp post_order_transverse(node1)
