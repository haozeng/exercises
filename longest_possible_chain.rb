require 'pry'

# The length of chain: 'bdca' -> 'bca' -> 'ba' -> 'a'

def longest_possible_chain(words)
  # 1
  chain_count = 1
  max = 1
  hash = Hash.new()

  # 2
  count = words[0]
  words = words[1..-1]

  words.each do |word|
    length = word.length
    hash[length] ||= []
    hash[length] << word
  end

  # 3
  hash = Hash[hash.sort_by{|k,v| -k}]

  hash.each_with_index do |(k, v), i|
    if hash.values[i+1] && (remove_one_elements(v) & hash.values[i+1]).any?
      chain_count += 1
    else
      max = chain_count
      chain_count = 0
    end
  end

  puts max
end

def remove_one_elements(values)
  values.inject([]) do |memo, value|
    array = value.split('')

    for i in 0..array.length - 1
      array.slice!(i)
      memo << array.join('')
      array = value.split('')
    end
    memo
  end.uniq
end

words = [6, 'a', 'b', 'ba', 'bca', 'bda', 'bdca']
longest_possible_chain(words)