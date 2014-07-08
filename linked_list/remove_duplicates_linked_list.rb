# Remove all duplicates from a linked list. Try to not use extra data

# Put all the elements in a hash where key is the element, value is the
# number of duplicates found. Then run delete(element) as many times
# as necessary per entry found so that no duplicates remain in the list.
#
# Can you do it without storing extra data?
# Yes. Problem is it would take n squared, since I would be checking
# every single element against the remaining elements,
# and that is very inefficient.
# Another (more efficient) approach is to order the linkedlist first,
# then check every node against its "next" and that way detecting dups
# is easy and fast, but then again, most sorting algorithms require
# storing extra data temporarily.

def remove_duplicates(list)
  d = list.clone
  dups = find_duplicates(list).each_with_object([]) { |(k, v), a| a << k if v > 1 }
  dups.each { |i| d.delete(i) }
  d
end

def find_duplicates(list)
  list.each_with_object(Hash.new(0)) { |e, o| o[e] += 1 }
end

def easiest_way(list)
  list.uniq
end

### Order & remove duplicates

def remove_duplicates(list)
  list.sort!
  first_element    = list.first
  previous_element = list.first
  list[1..-1].map do |element|
    element = nil if element == previous_element
    previous_element = element
  end.compact.unshift(list.first)
end

### Operating with the list as a set removes the duplicates too
# Set operations (intersection, union) return a list with unique elements

def remove_duplicates(list)
  list & list # list | list would work too
end

### A purely functional solution
# Creating a hash forces the keys to be unique, returning the keys will return
# the list without duplicates.

def remove_duplicates(list)
  list.inject({}){ |ele, n| ele[n] = nil; ele }.keys
end
