def non_repeated word
  hash = Hash.new(0)
  word.split('').each do |letter|
    hash[letter] += 1
  end

  hash.each do |k,v|
    return k if v == 1
  end
end

puts non_repeated('yellow')
puts non_repeated('tooth')

# File.open('intersection.txt').each_line do |line|
#   params = line.split(' ').map(&:to_i)
#   puts detect_cycle(params).join(' ')
# end
