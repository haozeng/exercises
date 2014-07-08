def split_numbers(number, pattern)
  operator = pattern.match(/[+|-]/).to_s
  params = pattern.split(/[+|-]/)
  left = number.slice(0..params[0].length-1)
  right = number.slice(params[0].length..number.length-1)
  left.to_i.send(operator, right.to_i)
end

File.open('split_the_number.txt').each_line do |line|
  params = line.split
  puts split_numbers(params[0], params[1])
end
