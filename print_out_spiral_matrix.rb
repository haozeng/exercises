require 'pry'
require 'pp'

def spiral_matrix(matrix)
  i, j = matrix[0].size - 1, matrix.size - 1
  jc, ic, jd, id = 0, i, j, 0

  while jc <= ic && id <= jd

    for i in id..ic
      puts matrix[jc][i]
    end

    jc += 1

    for j in jc..jd
      puts matrix[j][ic]
    end

    ic -= 1

    ic.downto(id) do |i|
      puts matrix[jd][i]
    end

    jd -= 1

    jd.downto(jc) do |j|
      puts matrix[j][id]
    end

    id += 1
  end
end

# For 4x4, even size matrix
matrix = [[1,2,3,4],[12,13,14,5],[11,16,15,6],[10,9,8,7]]
spiral_matrix(matrix)

# For 5x5, even size matrix
matrix = [[1,2,3,4,5],[16,17,18,19,6],[15,24,25,20,7],[14,23,22,21,8],[13,12,11,10,9]]
spiral_matrix(matrix)
