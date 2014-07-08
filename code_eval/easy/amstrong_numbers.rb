def armstrong? num
  n = num.length
  num.chars.inject(0) { |sum,d| sum + (d.to_i ** n) } == num.to_i
end

File.open('amstrong_numbers.txt').each_line do |line|
  puts armstrong? (line.strip).to_s
end
