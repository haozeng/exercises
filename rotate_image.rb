require 'pp'
require 'pry'

def rotate_image(matrix)
  n = matrix.size

  for i in 0..n/2 - 1
    for j in 0..n/2 - 1
      tmp = matrix[i][j]
      matrix[i][j] = matrix[n - 1 - j][i]
      matrix[n - 1 - j][i] = matrix[n - 1 - i][n - 1 - j]
      matrix[n - 1 - i][n - 1 - j] = matrix[j][n - 1 - i]
      matrix[j][n - 1 - i] = tmp
    end
  end
end

# matrix = [[1,2],[3,4]]
# rotate_image(matrix)
# matrix.each{|r| pp r}

matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]

matrix.each{|row| pp row}

rotate_image(matrix)

matrix.each{|row| pp row}
