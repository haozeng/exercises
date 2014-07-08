require 'pry'

def find_subset(line)
  integers = line.split(',').map{|i| i.to_i}
  subsets = []
  3.upto(integers.size-1) do |n|
    integers.combination(n).to_a.each do |com|
      subsets << com
    end
  end
  subsets.delete_if do |set|
    set[0..-2].inject(:+) != set[-1]
  end
  subsets.size
end

line = gets.chomp
puts find_subset(line)
