# Calculating Fibonacci sequence interatively

def fibonacci(n)
   i = 0
   j = 1
   cur = 0
   while cur <= n
     k = i
     i = i + j
     j = k
     cur = cur + 1
   end
   i
end

def fibonacci(n)
  n.times.inject([0,1]){|memo,value| memo << memo[-1] + memo[-2] }
end

fibonacci(10)

def fibonacci(n)
  a,b = 0, 1
  i = 2
  while i < n
    a, b = b, a + b
    i += 1
  end
  b
end

fibonacci(10)

describe "fibonacci" do
  it 'should return 5 if n is 4' do
    fibonacci(4).should eql(5)
  end

  it 'should return 21 if n 7' do
    fibonacci(7).should eql(21)
  end

  it 'should return 55 if n 9' do
    fibonacci(9).should eql(55)
  end
end
