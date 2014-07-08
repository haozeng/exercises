require 'benchmark'
#1.1

def unique_characters(string)
  array = string.split("")
  hash = Hash.new(0)
  array.each do |element|
    hash[element] += 1
  end
  hash.map{|k,v| k if v > 1}.compact
end

def unique_characters_wo_hash(string)
  array = string.split('')
  storage = []
  array.each do |element|
    if storage.include?(element)
      return false
    else
      storage << element
    end
  end
  true
end

puts Benchmark.measure{ unique_characters('aaaaaabcd') }
puts Benchmark.measure{ unique_characters_wo_hash('aaaaaabcd') }

describe 'it finds out the unique charaters' do
  it 'unique_characters' do
    string = 'abcdddd'
    result = unique_characters(string)
    result.should eql(['d'])
  end

  it 'unique_characters_wo_hash' do
    string = 'abcdddd'
    result = unique_characters_wo_hash(string)
    result.should be_false
  end
end


#1.2

def swap_string(string)
  (string.length/2).times do |i|
    string[i], string[-1-i] = string[-1-i], string[i]
  end
  string
end

describe 'swap strings' do
  it 'swap_string' do
    result = swap_string('abcde')
    result.should eql('edcba')
  end
end

#1.3

def permunation_string(a, b)

  hash_one = Hash.new(0)
  a.split('').map do |e|
    hash_one[e] += 1
  end

  hash_two = Hash.new(0)
  b.split('').map do |e|
    hash_two[e] += 1
  end
  hash_one == hash_two
end

describe 'permunations' do
  it 'permunations strings' do
    result = permunation_string('abcd', 'dcba')
    result.should be_true
  end

  it 'return false for non permutations' do
    result = permunation_string('abcd', 'dcbasdfasd')
    result.should_not be_true
  end
end

#1.4

def replace_character(string, default='%20')
  length = string.length
  space_count = 0
  0.upto(length-1) do |i|
    space_count += 1 if string[i] == ' '
  end

  new_length = space_count * 2+ length

  string_new = ""
  (length-1).downto(0) do |i|
    if string[i] == ' '
      string_new = '%20' + string_new
    else
      string_new = string[i] + string_new
    end
  end

  string_new
end

describe '' do
  it 'replace charaters without using replace' do
    response = replace_character(' ab cd')
    response.should == '%20ab%20cd'
  end
end
