File.open('intersection.txt').each_line do |line|
  params = line.split(';')
  seta = params[0].split(',').map!(&:to_i)
  setb = params[1].split(',').map!(&:to_i)
  puts (seta & setb).join(',')
end
