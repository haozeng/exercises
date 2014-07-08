# Assume element is increasing order in both rows and columns

def find_element_in_2d_array(2d_array, target)
  i_max = 2d_array[0].length - 1
  j_max = 2d_array.length - 1

  return false if target < 2d_array[0][0] || target > 2d_array[j_max][i_max]

  i, j = 0, j_max

  while i <= i_max && j >= 0
    return true if 2d_array[j][i] == target

    if 2d_array[j][i] > target
      j -= 1
    else
      i += 1
    end
  end
  false
end

def divide_and_conquer_approach(matrix, target)

end
