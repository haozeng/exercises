require './sale_purchase_model'
require 'pry'
require 'pp'

describe Seller do
  let(:seller) { Seller.new }

  it "seller should responde to balance" do
    expect(seller).to respond_to(:balance)
  end

  it "seller should responde to products" do
    expect(seller).to respond_to(:products)
  end

  it "seller should have empty array as initial products" do
    expect(seller.products).to eql([])
  end

  context "#add_product" do
    let(:product) { Product.new }

    it "seller's product size should increase" do
      seller.add_product(product)
      expect(seller.products.size).to eql(1)
    end

    it "after seller add product, product should have seller information" do
      seller.add_product(product)
      expect(product.seller).to eql(seller)
    end
  end

  context "#payouts" do
    let(:seller) { Seller.new }
    let(:product_one) { Product.new price: 10 }
    let(:product_two) { Product.new price: 5 }

    before do
      seller.add_product(product_one)
      seller.add_product(product_two)
      product_one.is_purchased!
      product_one.is_purchased!
      product_two.is_purchased!
    end

    it "should generate total payments for two products" do
      expect(seller.payouts).to eql(25)
    end

    it "should generate total based time range given" do
      range = { start_time: Date.today.weeks_ago(1), end_time: Date.today.advance(days: 1) }
      product_one.purchases.last.transaction_time = Date.today.months_ago(1)
      expect(seller.payouts(range)).to eql(15)
    end
  end
end

describe Product do
  let(:product) { Product.new }

  it "product should respond to price" do
    expect(product).to respond_to(:price)
  end

  it "product should respond to seller" do
    expect(product).to respond_to(:seller)
  end

  it "product should respond to purchases" do
    expect(product).to respond_to(:purchases)
  end

  it "product should have empty array as initial purchases" do
    expect(product.purchases).to eql([])
  end

  context "#is_purchased!" do
    let(:seller) { Seller.new }
    let(:product) { Product.new price: 10 }

    before do
      seller.add_product(product)
    end

    it "product's purchase size should increase" do
      product.is_purchased!
      expect(product.purchases.size).to eql(1)
    end

    it "purchase knows product info and updates its status" do
      product.is_purchased!
      purchase = product.purchases.last
      expect(purchase.product).to eql(product)
      expect(purchase.status).to eql('complete')
    end

    it "it notify_seller should be called" do
      product.should_receive(:notify_seller)
      product.is_purchased!
    end

    it "it should notify seller and seller will update its balance" do
      seller.add_product(product)
      product.is_purchased!
      expect(seller.balance).to eql(10)
    end
  end
end

describe Purchase do
  let(:purchase) { Purchase.new }

  it "purchase should respond to status" do
    expect(purchase).to respond_to(:status)
  end

  it "purchase should respond to transaction time" do
    expect(purchase).to respond_to(:transaction_time)
  end

  context "#refund!" do
    let(:seller) { Seller.new }
    let(:product) { Product.new price: 10 }

    before do
      seller.add_product(product)
      product.is_purchased!
      @purchase = product.purchases.last
    end

    it "purchase could ask for refund from seller and seller should be notified" do
      @purchase.should_receive(:nofity_seller_and_refund)
      @purchase.refund!
    end

    it "purchase could ask for refund from seller and seller's balance should be reduced" do
      @purchase.refund!
      expect(@purchase.product.seller.balance).to eql(0)
      expect(@purchase.status).to eql('refunded')
    end
  end

  context "#within_range?" do
    let(:purchase_one) do
      p = Purchase.new
      p.transaction_time = Date.today.weeks_ago(1)
      p
    end
    let(:purchase_two) do
      p = Purchase.new
      p.transaction_time = Date.today.months_ago(1)
      p
    end

    it "given range, it should return true/false" do
      range = { start_time: Date.today.weeks_ago(2), end_time: Date.today }
      expect(purchase_one.within_range?(range)).to eql(true)
      expect(purchase_two.within_range?(range)).to eql(false)
    end
  end
end
