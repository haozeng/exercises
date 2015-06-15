# set operations
  # if cache is empty, then add the current content in the first node also update the hash with page_number and content
  # else check to see if cache already exists, if it does, then remove it from the linked_list and add it back to the head
  # if it does not exist, check to see if the maximum size of linked_list has reached, if it is reached, remove the rear element

# get operations
  # read the content based on the page number

class LRU
  def initialize
    @cache = LinkedList.new
    @hash = Hash.new
  end

  def set(page, content)
    node = Node.new(value: content)

    if @cache.empty?
      @hash[page] = node
      @cache.head = node
    end

    if @hash[page]
      c = @hash[page]
      c.previous.next = c.next
    else
      if @cache.size > 10
        @cache[-1].next = nil
      end
    end
    @cache.next = node
  end

  def get(page)
    @hash[page].value
  end
end