def largest_pandlindrome_product
  max = 0
  (100..999).each do |i|
    (i..999).each do |j|
      product = i * j

      if product.to_s.reverse == product.to_s && product > max
        max = product
      end

    end
  end
  puts max
end

largest_pandlindrome_product
