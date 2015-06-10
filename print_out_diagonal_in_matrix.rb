require 'pry'

def print_out_diagonal(matrix)
  row = matrix.size
  col = matrix[0].size

  for r in 0..row-1
    i = r
    j = 0
    while i >= 0 && j < col
      puts matrix[i][j].to_s + ' '
      i -= 1
      j += 1
    end
  end

  for c in 1..col-1
    j = c
    i = row - 1
    while i > 0 && j < col
      puts matrix[i][j].to_s + ' '
      i -= 1
      j += 1
    end
  end
end


matrix = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16], [17,18,19,20]]

print_out_diagonal(matrix)