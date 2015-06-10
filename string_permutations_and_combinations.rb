require 'pry'
require 'pp'

# def permutation_on_lowercase(string)
#   if string.length == 1
#     return [string, string.upcase]
#   end

#   first = string[0]
#   remaining = string[1..-1]

#   for i in 0..remaining.length - 1
#     result = []
#     permutation_on_lowercase(remaining).each do |c|
#       result << c + first
#       result << c + first.upcase
#     end
#     result
#   end
#   result
# end

# puts permutation_on_lowercase('ab')
# puts permutation_on_lowercase('abc')


# sudo code:

# 1. return empty array if word size is 0
#    return itself if word size is 1
# 2. split the first word from string, and put the reminder into the recursive function.
# 3. array of different formats should be returned from the resurive functions,
#    for each word in this array, we want to insert the first word into different locations
#    of the word
# 4. return different permutations of the word

def string_permutation(word)
  return [] if word.size == 0
  return [word] if word.size == 1

  first = word[0]
  reminder = word[1..-1]

  words = string_permutation(reminder)

  words.inject([]) do |results, word|
    array = word.split('')
    for i in 0..word.size
      results << array.insert(i, first).join
      array = word.split('')
    end
    results
  end
end

puts string_permutation 'abc'

# def perms word
#   return [] if word.size == 0
#   return [word] if word.size == 1
#   word.chars.each_with_index.map do |c,index|
#     rest = word.dup
#     rest.slice!(index)
#     perms(rest).map do |perm|
#       c + perm
#     end
#   end.flatten
# end

# puts perms 'abc'

# pp string_permutation('abcd')

# sudo code:

# 1. return empty array if word size is 0
#    return itself if word size is 1
# 2. split first letter, and put reminder into recursive function
#    results should be an array of reminder words combinations
# 3. interate each word in the results, and for each one,
#    we can add the first letter into it or we can choose not to add the first letter.
# 4. return the combinations.


def comb word
  return [] if word.size == 0
  return [word] if word.size == 1

  first = word[0]
  reminder = word[1..-1]
  words = comb(reminder)
  words.inject([first]) do |memo, value|
    memo << value + first
    memo << value
    memo
  end
end

# @result = ''
# def comb_optimized word, index
#   for i in index..word.length - 1
#     @result += word[i]
#     pp @result
#     comb_optimized word, i+1
#     @result = @result.slice(0..-2)
#   end
# end

# @store = []
# def comb_optimized_two word
#   for i in 0..word.length - 1
#     if @store.any?
#       store_dup = @store.dup
#       store_dup.each do |comb|
#         @store << comb + word[i]
#       end
#     end
#     @store << word[i]
#   end
# end

# # comb_optimized_two 'abc'
# comb_optimized_two 'wxyz'
# puts @store.size

