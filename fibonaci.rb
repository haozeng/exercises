def fibonaci(n=10)
  puts n
  return 0 if n == 0
  return 1 if n == 1
  return fibonaci(n - 1) + fibonaci(n - 2)
end

puts fibonaci(5)
