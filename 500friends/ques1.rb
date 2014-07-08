def rotate(line)
  array = line.split(' ').sort

  new_array = array.each_slice(3).to_a

  result = ''
  for j in 0..new_array[0].size - 1
    for i in 0..2
      puts new_array[i][j]
      result += new_array[i][j] + ' '
    end
    result += "\n"
  end
  result
end

line = gets.chomp
puts rotate(line)
