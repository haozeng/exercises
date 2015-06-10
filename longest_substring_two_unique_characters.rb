require 'pry'

# sudo code:

# 1. initialize two strings, one longest string and one current string,
#    a hash to keep track of frequency of characters

def longest_substring_which_contains_two_unique_characters(string)
  longest = ''
  current = ''
  hash = Hash.new(0)

  string.split('').each do |s|
    current += s

    if hash[s] > 0
      hash[s] += 1
    else
      hash[s] += 1
      if hash.size > 2
        longest = longest.length > current.length ? longest : current
        # binding.pry
        pair = hash.min_by{|k,v| v}
        hash.delete(pair[0])

        current = current[1..-1]
      else
        current += s
      end
    end
  end

  longest
end

puts longest_substring_which_contains_two_unique_characters('abcbbbbcccbdddadacb')