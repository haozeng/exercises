# Recursively

# row: m, column: n

def recursively_count(m, n)
  return 1 if m == 1 || n == 1

  recursively_count(m-1, n) + recursively_count(m, n-1)  
end

# Iteratively, DP

def iteratively_count(m, n)
  matrix = [Array.new(n)]*m

  # count the path to reach any cell in column 1
  for i in 0..m-1
    matrix[i][0] = 1
  end

  # count the path to reach any cell in row 1
  for j in 0..n-1
    matrix[1][j] = 1
  end

  for i in 1..m-1
    for j in 1..n-1
      matrix[i][j] = matrix[i-1][j] + matrix[i][j-1]
    end
  end

  matrix[m-1][n-1]
end

puts iteratively_count(3,3)