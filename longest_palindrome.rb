require 'pry'
require 'pp'

def get_panlindrome(string, start, tail)
  while string[start] == string[tail] && start >= 0 && tail < string.length
    start -= 1
    tail += 1
  end
  string[start + 1..tail - 1]
end

# Running time is O(n^2)

def longest_palindrome(string)
  length = string.length
  return string if length == 1

  longest = string[0]
  for i in 0..length - 1

    palindrome = get_panlindrome(string, i, i)

    if palindrome.length > longest.length
      longest = palindrome
    end

    palindrome = get_panlindrome(string, i, i+1)

    if palindrome.length > longest.length
      longest = palindrome
    end

  end
  longest
end

pp longest_palindrome('aba')
pp longest_palindrome('abadd')
pp longest_palindrome('abba')
pp longest_palindrome('sadfjhdsakjfabba')
pp longest_palindrome('ddddffddddabba')
