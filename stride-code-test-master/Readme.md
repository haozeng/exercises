Stride Code Test
=================
Welcome to the alpha release of the Stride code test. Since this is a brand new test, we expect there to be problems, 
mistakes and plenty of confusion. Please do not hesitate to ask questions and suggest improvements, 
by emailing codetest@stridenyc.com.
 
The test is an extension of a problem from HackerRank with some new requirements that need to be implemented.

* Note: please do not share this test or your answer with anyone. The test and your solution is intended to be private.
If you decide to put it on github via fork or import, please make sure do it into a private repository.

Instructions
------------

### Language/Libraries
 - Both the Ruby test and the Java test are included.
    - Please only do one of them. Submitting both tests does not earn you any extra credit. In fact that 
    just means we have to grade 2 tests -- that's NOT twice as much fun.
    - Much of the language in this readme refers to the Ruby version, but it should translate pretty well for the Java
    folks. Again, if something is unclear, please ask. (Or learn Ruby!)
 - Do not use any outside gems/jars aside from what's already in the gemfile or pom.xml. 
 The bulk of the test should be plain Ruby/Java code.
 - If anything looks missing from the basic project setup for either Ruby or Java please tell us so we can fix it.

### Submission
Please submit your code as a zip file. (No, we don't want to fork the repo, because the whole GitHub private repo
 thing can be a pain.)

### Do not add your name
- Please do not add your name, github profile or any identifying information to any file. Code tests will be anonymized before grading.
 
### Specs/Tests 
 - Add as many specs as you need, though they are optional. Any specs you do add should be in the "spec" or "test" folder
and run successfully by running the default `rake spec` task or `mvn test`.
    - If you do add any specs/tests, please submit them! We'd like to see them.

### Grades
- Your code will be graded on
    - Design
    - Correctness
    - Code quality metrics such as cleanliness, readability, maintainability and simplicity. Basically, 
    put out there what you would consider *good* code.
    - This is not a timed test, so you will not be graded on how quickly you turn around an answer. Please take your
    time and focus on the above.
- We ARE NOT concerned about how fast the code performs. (It's a small chocolate shop!)

### Running
- Please tell us how to run your program. We expect to be able to run it and for it to generate the output file specified.


Original Problem
================
From [HackerRank](https://www.hackerrank.com/challenges/chocolate-feast)

Little Bob loves chocolates, and goes to the store with cash in his pocket. The price of
each chocolate is price. The store offers a discount: for every 'wrappers needed' number of wrappers
he gives the store, he’ll get one chocolate for free. 

The free chocolate program has been successful, and they've decided to tweak the promotion.

Chocolate Types
---------------
The store is now pushing certain types of chocolates. There are
four types, white, dark, milk and sugar free and the store
is giving away an extra sample of chocolates in addition to the original wrapper promotion.
For the original wrapper promotion, the free chocolates will be of the same
type that you are buying for that purchase. Note that if Bob accumulates enough wrappers of the other type,
he can trade those in as well.

- If you trade in wrappers for milk or white, you get an extra sugar free chocolate along with
every free milk or white chocolate that you would normally get.
- If you trade in wrappers for sugar free chocolate, you get an extra dark chocolate along
with every free sugar free chocolate that you get.
- Since dark is all the rage, that is considered premium and there is no additional candy bonus.

The code test itself:
---------------

We have given you four orders in the input/orders.txt file and we expect your program to read those orders and generate output matching output/output.txt.

Explanation of the numbers in the output file:

1. He buys 6 milk chocolates and trades in 5 wrappers to get 1 free milk chocolate. He also gets one sugar free.
2. He buys 3 dark chocolates, but since wrappers needed is 4 he can't trade any wrappers in to get anything free.
3. He can buy 3 sugar_free chocolates for $6. Now he can give 2 of this 3 wrappers and get 1 sugar_free
chocolate. Again, he can use his 1 unused wrapper and 1 wrapper of new chocolate to get one more chocolate. 
Total is 5 sugar free. Since he got 2 bonus sugar_free chocolates, he also gets 2 bonus dark chocolates. 
And since he got 2 dark chocolates, he can trade both of those in for an extra dark.
4. He buys 3 white and trades in 2 white wrappers for 1 white and 1 sugar free. Now he can use the extra white wrapper to get another white and another sugar free. Those 2 sugar free wrappers get another sugar free and a dark.