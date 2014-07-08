def to_base(number, n)
  reminders = []
  while number >= n
    reminders << number % n
    number /= n
  end
  reminders << number
  reminders.reverse!
  reminders.join('').to_i
end

puts to_base(13, 3)
puts to_base(1208, 26)
