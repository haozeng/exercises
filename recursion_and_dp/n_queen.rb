require 'pry'
# Idea is to iterate the column one by one and recursively call the function by adding row
# and we want to save the column value in an array, index: number_of_row, value: number_of_col
# because we keep incrementing row by one

def check_valid(columns, row, col)
  for pre_r in 0..row-1
    pre_c = columns[pre_r]

    # check to see if queue in the same column
    return false if pre_c == col

    # check diagonals
    col_dis = (col - pre_c).abs
    row_dis = (row - pre_r).abs

    return false if col_dis == row_dis
  end
  true
end

@results = []

def place_queens(row=0, columns=[])
  if row == 8
    pp columns
    @results << columns
  else
    for col in 0..7
      if check_valid(columns, row, col)
        # pp columns
        columns[row] = col
        place_queens(row+1, columns)
      end
    end
  end
end

place_queens
# pp @results