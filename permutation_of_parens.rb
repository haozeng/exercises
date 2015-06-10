require 'pry'

# If there's nothing on stock, the string is fully built and you can just print it out

# If there's an open parenthesis available on stock, try and add it on.
# Now you have one less open parenthesis, but one more close parenthesis to balance it out

# If there's a close parenthesis available on stock, try and add it on.
# Now you have one less close parenthesis

# Print all permutations of 3 pair of parens. ()()(), (()()), (())(),,,. etc
def foo output, open, close, pairs
  if open == pairs and close == pairs
    p output
  else
    foo(output + '(', open+1, close, pairs) if open < pairs
    foo(output + ')', open, close+1, pairs) if close < open
  end
end

foo('', 0, 0, 3)