# sudo code:

# 1. initialize a empty hash with default value as false, initialize a empty string
# 2. interate string add each element to the hash and change value to true, and add element into the string 
# 3. for next element, if value is true, then return from the process

def unique_prefix(string)
  hash = Hash.new(false)
  uniq = ''

  string.each_char do |e|
    if hash[e]
      return uniq
    end

    hash[e] = true
    uniq << e
  end
end

puts unique_prefix('pill')
puts unique_prefix('palessp')