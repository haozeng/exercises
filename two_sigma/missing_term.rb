require 'pry'
# 1. count the difference of consequtive elements for the first three letters.
# 2. find the ones which appear more than once. and print out that one
# 3. iterate each letter by adding the number found in #2 and print out the one which doesn't add up.

def missing_term(terms)
  # 1
  s = Hash.new(0)
  s[terms[1] - terms[0]] += 1
  s[terms[2] - terms[1]] += 1
  s[terms[3] - terms[2]] += 1

  # 2
  value = s.select { |_, v| v >= 1 }.keys[0]

  # 3
  terms.each_with_index do |term, index|
    return term+value if term+value != terms[index+1]
  end

  false
end

puts missing_term([1,3,5,9,11])