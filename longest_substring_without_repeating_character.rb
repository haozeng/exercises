def longest_non_repeating_substring(string)
  rep = 0
  hash = {}

  string.split('').each_with_index do |s, index|
    if hash[s]
      rep = rep > hash.size ? rep : hash.size
      hash = {}
    else
      hash[s] = index
    end
  end

  [rep, hash.size].max
end

puts longest_non_repeating_substring('abcabc')
puts longest_non_repeating_substring('bbbb')
puts longest_non_repeating_substring('bacdefgb')
