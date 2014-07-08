require 'pry'
require 'active_support/time'

class Seller
  attr_accessor :balance
  attr_reader :products

  def initialize
    @balance = 0
    @products = []
  end

  def add_product(product)
    @products << product
    product.seller = self
  end

  def payouts(range={})
    products.inject(0) do |total, product|
      if product.purchases.any?
        total += product.price * product.purchases_within_range(range)
      else
        total
      end
    end
  end
end

class Product
  attr_reader :price, :purchases
  attr_accessor :seller

  def initialize(args={})
    args = defaults.merge(args)
    @price = args[:price]
    @purchases = args[:purchases]
  end

  def is_purchased!
    purchase = Purchase.new
    @purchases << purchase
    update_purchase(purchase)
    notify_seller
  end

  def defaults
    { price: 0, purchases: [] }
  end

  def purchases_within_range(range)
    purchases.select { |p| p.within_range?(range) }.size
  end

  private

  def update_purchase(purchase)
    purchase.complete!(self)
  end

  def notify_seller
    seller.balance += price
  end
end

class Purchase
  attr_accessor :product, :status, :transaction_time

  def complete!(product)
    self.product = product
    self.status = 'complete'
    self.transaction_time = Time.now
  end

  def refund!
    nofity_seller_and_refund
    self.status = 'refunded'
  end

  def within_range?(range)
    range.empty? ? true : transaction_time.between?(range[:start_time], range[:end_time])
  end

  private

  def nofity_seller_and_refund
    product.seller.balance -= product.price
  end
end
