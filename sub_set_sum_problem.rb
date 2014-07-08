require 'pry'
require 'pp'
require 'matrix'

# def subset_sum_recursive(set, n, sum, path)
#   if sum == 0
#     pp path
#     return true
#   end

#   return false if sum != 0 and n == 0

#   return subset_sum_recursive(set, n-1, sum, path) if set[n-1] > sum

#   path_t = path + [set[n-1]]
#   subset_sum_recursive(set, n-1, sum-set[n-1], path_t) || subset_sum_recursive(set, n-1, sum, path)
# end

# set = [1,2,3,4]
# n = set.length
# sum = 6

# pp subset_sum_recursive(set, n, sum, [])


# def subset_sum_recursively(set, n, sum)
#   return true if sum == 0
#   return false if n == 0

#   return subset_sum_recursively(set, n-1, sum) if set[n-1] > sum

#   subset_sum_recursively(set, n-1, sum-set[n-1]) || subset_sum_recursively(set, n-1, sum)
# end

# set = [1,2,3,4]
# n = set.length
# sum = 6

# pp subset_sum_recursively(set, n, sum)


def dynamic_programming(set, n, sum)
  matrix = []
  (sum+1).times { matrix << Array.new(n+1, 0) }

  for j in 0..n
    matrix[0][j] = 0
  end

  for i in 0..sum
    matrix[i][0] = 0
  end

  for i in 1..n
    for j in 1..sum
      if j < set[i-1]
        matrix[j][i] = matrix[j][i-1]
      else
        matrix[j][i] = [matrix[j][i-1], set[i-1] + matrix[j-set[i-1]][i-1]].max
      end
    end
  end
  pp matrix
end

set = [1,2,3,4]
sum = 4
n = 4

dynamic_programming(set, n, sum)

def target_value_exist_version_two?(set, sum)
  matrix = []
  (sum+1).times { matrix << Array.new(set.size+1) }
  n = set.size

  for i in 0..sum
    matrix[i][0] = false
  end

  for j in 0..n
    matrix[0][j] = true
  end

  for i in 1..n
    for j in 1..sum
      if j < set[i-1]
        matrix[j][i] = matrix[j][i-1]
      else
        matrix[j][i] = matrix[j][i-1] || matrix[j-set[i-1]][i-1]
      end
    end
  end
  pp matrix
end

set = [1,2,3,4]
sum = 4
n = 4

target_value_exist_version_two?(set, sum)
