# You have two numbers represented by a linked list where each node
# contains a single digit. The digits are stored in reverse order.
# Write a function that adds the numbers and returns the sum as a linked
# list

def add(num_1, num_2)
  sum   = []
  carry = false

  num_1.each do |digit_1|
    digit_1 += 1 if carry

    num_2.empty? ? result = digit_1 : result = digit_1 + num_2.shift
    # .shift can be replaced by .reverse.pop 

    if result > 9
      carry   = true
      result -= 10
    else
      carry = false
    end

    sum << result
  end                                                                     

  sum
end
