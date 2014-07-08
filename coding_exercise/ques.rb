# Write a program which prints the numbers from 1 to N, each on a new line. But for multiples of three print “Fizz” instead of the number 3 and for the multiples of five print “Buzz”.  For numbers which are multiples of both three and five print “FizzBuzz”. Read in the input number from STDIN.

def fizz_buzz(n)
  1.upto(n) do |i|
    output = ''
    output += 'Fizz' if i%3 == 0
    output += 'Buzz' if i%5 == 0
    puts output.empty? ? i : output
  end
end

number = Integer(gets)

fizz_buzz(number)
