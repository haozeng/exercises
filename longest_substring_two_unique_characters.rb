require 'pry'

def longest_substring_which_contains_two_unique_characters(string)
  longest = ''
  current = ''
  hash = {}

  string.split('').each do |s|
    if hash[s]
      current += s
    else
      hash[s] = true
      if hash.size > 2
        longest = longest.length > current.length ? longest : current
        hash = {}
        current = ''
      else
        current += s
      end
    end
  end

  longest
end

puts longest_substring_which_contains_two_unique_characters('abcbbbbcccbdddadacb')
