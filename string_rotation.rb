def string_rotation(s1, s2)
  s3 = s2 + s2

  s3.include? s1
end

puts string_rotation('abc','bca')
puts string_rotation('abc','cba')
