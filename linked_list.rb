#2.1
def remove_duplicates(list)
  hash_table = list.inject(Hash.new(0)) { |hash, element| hash[element] += 1; hash}
  hash_table.each { |k, v| list.delete(k) if v > 1 }
  list
end

describe 'linked list' do

  it 'removes the duplicated records' do
    list = [1, 2, 2, 3, 4, 5, 1, 2]
    result = remove_duplicates(list)
    result.should eql([3, 4, 5])
  end
end

#2.2
def find_k_from_the_last(list, k)
  p1 = 0
  p2 = 0 + k - 1

  while list[p2] != nil
    p1 += 1
    p2 += 1
  end
  list[p1-1]
end

describe 'find k from the last' do
  it 'find the kth element from the last' do
    list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    result = find_k_from_the_last(list, 3)
    result.should eql(8)
  end
end
