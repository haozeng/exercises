def multiples(x, n)
  multiple = n
  i = 1
  while multiple < x
    i += 1
    multiple *= i
  end
  multiple
end


File.open(ARGV[0]).each_line do |line|
  params = line.split(',')
  puts multiples(params[0].to_i, params[1].to_i)
end
