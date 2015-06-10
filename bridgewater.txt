# Thought Process:
# We want to use a nested hash structure as we iterate the string to save the count as well as the location 
# of each word, so total time complexity is O(n), since we are just iterating the total string once.
# Here I simply use ruby to demonstrate the idea and write the program

# 1. Scan through the whole string and find out places where . is being used other than the end of sentence. 
#    Replace . with {dot} in those places, Note: we want to add appropriate regrex if needed, in this case, it is i.e.
# 2. Split the string after each sentence ending with .
# 3. For each sentence, we want to iterate each word and count the appearance of the word and the index, the location of the word in the string.
# 4, In the last, we iterate the nested hash and print out the word, number of its appearance and its appearing location.

string = 'Given an arbitrary text document written in English, write a program that will generate a '\
'concordance, i.e. an alphabetical list of all word occurrences, labeled with word frequencies.'\
' Bonus: label each word with the sentence numbers in which each occurrence appeared.'

def concordance(string)
  # Initialize the hash
  concordance = {}

  # Replace the . with {dot} using regrex, and in this case it is just i.e.
  # Split the sentence
  string.gsub!(/(i)\.(e)\./, "i{dot}e{dot}").split('.').each_with_index do |sentence, index|
    # Iterate words in the sentence
    sentence.gsub(',', '').split(' ').each do |word|
      # Change the {dot} back to .
      word = word.gsub(/{dot}/, '.').downcase
      # Save the index and its count in the nested hash
      concordance[word] ||= [0, []]
      concordance[word][0] += 1
      concordance[word][1] << index + 1
    end
  end

  # Print out the hash based on the format accordingly
  concordance.sort_by { |k, _| k }.each do |pair|
    puts "#{pair[0]} {#{pair[1][0]}:#{pair[1][1].join(',')}}"
  end
end

# run the function
concordance(string)


# Execution instruction:
# ➜  exercises git:(master) ✗ ruby bridgewater.rb

# Output
# ➜  exercises git:(master) ✗ ruby bridgewater.rb
# a {2:1,1}
# all {1:1}
# alphabetical {1:1}
# an {2:1,1}
# appeared {1:2}
# arbitrary {1:1}
# bonus: {1:2}
# concordance {1:1}
# document {1:1}
# each {2:2,2}
# english {1:1}
# frequencies {1:1}
# generate {1:1}
# given {1:1}
# i.e. {1:1}
# in {2:1,2}
# label {1:2}
# labeled {1:1}
# list {1:1}
# numbers {1:2}
# occurrence {1:2}
# occurrences {1:1}
# of {1:1}
# program {1:1}
# sentence {1:2}
# text {1:1}
# that {1:1}
# the {1:2}
# which {1:2}
# will {1:1}
# with {2:1,2}
# word {3:1,1,2}
# write {1:1}
# written {1:1}