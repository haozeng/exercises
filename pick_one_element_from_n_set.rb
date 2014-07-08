require 'pry'
require 'pp'

def pick_one_from_n_set(set, pos, result)
  if pos == set.length
    pp result
    return true
  end

  current = set[pos]

  for i in 0..current.length - 1
    new_result = (result.dup << current[i])
    pick_one_from_n_set(set, pos+1, new_result)
  end
end

set = [[1,2], [3,4]]
pos = 0
result = []

pick_one_from_n_set(set, 0, [])


set = [[1,2], [3,4], [5,6]]
pos = 0
result = []

pick_one_from_n_set(set, 0, [])
