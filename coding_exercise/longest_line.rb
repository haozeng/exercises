def longest_line(words, n)
  list = []

  for i in 0..1
    list << words[i]
  end

  words.each do |word|
    m = list.inject(list[0]){|memo, word| word.length > memo.length ? memo : word }
    word.length > m.length ? list[list.index(m)] = word : nil
  end
  list
end

File.open('sample.txt') do |line|
  n = line.readline.to_i
  words = line.readlines.map(&:strip)
  puts longest_line(words, n)
end
