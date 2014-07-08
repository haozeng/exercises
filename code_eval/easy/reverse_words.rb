def reverse_words(words)
  words.split(' ').reverse.join(' ')
end

File.open(ARGV[0]).each_line do |line|
  puts reverse_words(line.to_s) unless line.to_s.empty?
end
