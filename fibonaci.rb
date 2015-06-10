def fibonaci(n=10)
  return 0 if n == 0
  return 1 if n == 1
  return fibonaci(n - 1) + fibonaci(n - 2)
end

# puts fibonaci(5)


def interative_fibonaci(n=10)
  a, b = 1, 2
  start = 3
  while start < n
    a, b = b, a + b
    start += 1
  end

  puts a + b
end

interative_fibonaci(7)