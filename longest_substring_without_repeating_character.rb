# sudo code:

# 1. initialize hash to keep track of appearance of letter in string
#    and a max to track largest repeating substring
# 2. iterate each letter in string, if letter is not in the hash, mark the value as true
#    else if letter is in the hash, count the hash size and replace it with the largest repeating string if needed
#    and reset the hash
# 3. print out the length of longest non repeating string

def longest_non_repeating_substring(string)
  rep = 0
  hash = {}

  string.split('').each_with_index do |s, index|
    if hash[s]
      rep = rep > hash.size ? rep : hash.size
      hash = {}
    else
      hash[s] = true
    end
  end

  [rep, hash.size].max
end

puts longest_non_repeating_substring('abcabc')
puts longest_non_repeating_substring('bbbb')
puts longest_non_repeating_substring('bacdefgb')