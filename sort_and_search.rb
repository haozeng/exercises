#11.1

def merge_arrays(a, b)
  al = a.length - 1
  bl = b.length - 1
  tl = al + bl + 1

  while bl >= 0
    if al >= 0 && a[al] > b[bl]
      a[tl] = a[al]
      al -= 1
    else
      a[tl] = b[bl]
      bl -= 1
    end
    tl -= 1
  end
  a
end

def merge_arrays_from_beginning(a,b)
  c = Array.new

  loop do
    break if a.empty? || b.empty?
    c << (a.first < b.first ? a.shift : b.shift)
  end
  c = c + a + b
end

describe 'merge two sorted array' do 
  it 'merge_arrays' do 
    a = [1, 2, 4, 6, 7]
    b = [3, 5, 8, 9, 10]
    c = merge_arrays_from_beginning(a, b)
    c.should eql([1,2,3,4,5,6,7,8,9,10])
  end
end

# 11.2

def sort_array_of_strings_for_anagrams(array)
  # table = {}
  # array.map do |element|
  #   s = element.chars.sort.join
  #   table[s] ||= []
  #   table[s].push(element)
  # end

  table = array.inject({}) do |memo, element|
    s = element.chars.sort.join
    memo[s] ||= []
    memo[s].push(element)
    memo
  end

  table.values.flatten
end

describe 'sort array of strings' do 
  it 'sort_array_of_strings_for_anagrams' do 
    array = ['god', 'dog', 'abc', 'cba', 'man']
    table = sort_array_of_strings_for_anagrams(array)
    table.should eql(['god', 'dog', 'abc', 'cba', 'man'])
  end
end



















