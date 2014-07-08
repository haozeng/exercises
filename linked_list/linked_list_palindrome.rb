# Check if a linked list is a palindrome 
               
it "should return true if there's only one element on the list" do
  list = List.new(0)
  assert list.is_palindrome?
end            

it "should read the same from head to tail as from tail to head" do
  list = List.new(0)
  list.append(1)
  list.append(0)

  assert list.is_palindrome?
end
 
it "should work for a list with an even number of elements" do
  list = List.new(0)
  list.append(1)
  list.append(1)
  list.append(0)

  assert list.is_palindrome?
end                    

Node = Struct.new(:value, :next)

class List 
  attr_reader :head, :length

  def initialize(value)
    @head = Node.new(value, nil)  
    @length = 1
  end

  def append(value)
    old_head = @head
    @head = Node.new(value, old_head)   
  end

  def is_palindrome?
    return true if @length == 1
    left_side = []

    list.each_with_index do |element, i|
      if i < @length / 2   
        left_side.push(element)
      elsif i > @length / 2
        return false if left_side.pop != element
      end
    end

    true
  end
end 
