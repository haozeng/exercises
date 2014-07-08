#3.1
class Stack
  attr_reader :list

  def initialize list=[]
    @list = list
  end

  def push(element)
    @list.push(element)
  end

  def pop
    @list.pop
  end

  def peek
    @list[-1]
  end

  def is_empty?
    @list.empty?
  end
end

describe Stack do 
  before do 
    @stack = Stack.new([1,2,3,5])
  end

  it 'push the element to the end' do 
    @stack.push(5)
    @stack.list.should eql([1,2,3,5,5])
  end

  it 'pop the last element' do 
    @stack.pop
    @stack.list.should eql([1,2,3])
  end

  it 'peeks the last element' do 
    element = @stack.peek
    element.should eql(5)
    @stack.list.should eql([1,2,3,5])
  end 
end


#3.4

def sort_stacks(list)
  a = Stack.new(list)
  b = Stack.new

  while !a.is_empty?
    element = a.pop
    while !b.is_empty? && b.peek > element
      a.push(b.pop)
    end
    b.push(element)
  end
  b
end

describe 'sort stack' do 
  it 'sort the stack' do 
    a = [1, 3, 5, 2, 4]
    b = sort_stacks(a)
    b.list.should eql([1,2,3,4,5])
  end
end

#3.6
class NewQueue
  attr_reader :stack, :queue

  def initialize(stack)
    @stack = stack
    @queue = nil
  end

  def enqueue(element)
    @stack.push(element)
    @queue = build_reverse_stack(@stack)
  end

  def dequeue
    @stack.pop
    @queue = build_reverse_stack(@stack)
    @queue.pop
  end

  private

  def build_reverse_stack(stack)
    b = Stack.new
    while !stack.is_empty?
      b.push(stack.pop)
    end
    b
  end
end

describe 'New Queue Class' do 
  before do 
    stack = Stack.new([1,5,3,2,4])
    @queue = NewQueue.new(stack)
  end

  it 'does not builds the reverse stack when the queue first instantiated' do
    @queue.queue.should be_nil
  end

  it 'enqueue the element' do 
    @queue.enqueue(10)
    @queue.queue.list.should eql([10,4,2,3,5,1])
  end

  it 'dequeue the element' do 
    @queue.dequeue.should eql 1
  end
end







