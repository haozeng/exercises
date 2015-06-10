# 1. count the difference of consequtive elements for the first three letters.
# 2. find the ones which appear more than once. and print out that one
# 3. iterate each letter by adding the number found in #2 and print out the one which doesn't add up.

def missing_term_in_ap(terms):
  
  t1 = terms[1] - terms[0]
  t2 = terms[2] - terms[1]
  t3 = terms[3] - terms[2]

