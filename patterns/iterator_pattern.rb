# Product has many purchases

class Product
  include Enumerable
  attr_reader :purchases

  def initialize
    @purchases = []
  end

  def each(&blk)
    @purchases.each(&blk)
  end
end

class Purchase
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

p1 = Purchase.new(5)
p2 = Purchase.new(10)

product = Product.new
product.purchases << p1 << p2
product.each { |purchase| puts purchase.price }
puts [p1, p2].max.price
