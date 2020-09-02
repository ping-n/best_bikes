require 'tty-prompt'
require_relative '../models/Product'

class ProductController
  def self.view_all_products
    # Assigning variable
    prompt = TTY::Prompt.new
    options = {}

    # Saving all the exiting Products in a variable
    products = Product.product_map

    # Loop through Products with index
    products.each_with_index do |item, index|
      # store each product info as a key and product uuid as value
      options.store("#{index + 1}: #{item.name} | $#{item.price}", item.uuid)
    end

    # Save product uuid from user into an array
    user_selection = prompt.multi_select('Please select a product to add to cart', options)

    # Passing the user selection to save_to_cart instance method
    save_selection(user_selection)
  end

  def self.view_cart
    # Loop through item in the shopping can display it to the user
    @cart.each_with_index do |item, index|
      puts "#{index + 1}: #{item.name} | $#{item.price}"
    end
    subtotal
  end

  def self.subtotal
    # Map through the cart, output the price to a float
    cart_subtotal = @cart.map do |item|
      item.price.to_f
    end
    # Sum of price from cart and save to the subtotal variable
    @subtotal = cart_subtotal.reduce(0) { |sum, n| sum + n }
  end

  def self.discount
    # Discount conditions
    over20 = 0.9
    over50 = 0.85
    over100 = 0.8

    # Applying the discounts
    case @subtotal
    when 0..20
      @total = @subtotal
    when 20..50
      puts 'Discount Applied: 10% off on total greater than $20'
      @total = (@subtotal * over20).round(2)
    when 50..100
      puts 'Discount Applied: 15% off on total greater than $50'
      @total = (@subtotal * over50).round(2)
    else
      puts 'Discount Applied: 20% off on total greater than $100'
      @total = (@subtotal * over100).round(2)
    end
  end

  class << self
    # For display the total price after discount
    attr_reader :total
  end

  def self.save_selection(selection)
    products = Product.product_map

    # Checked if the product matched the one selected by the user and add it to the shopping cart
    @cart = products.select do |item|
      selection.include? item.uuid
    end
  end
end
