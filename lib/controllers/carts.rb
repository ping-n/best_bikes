require 'colorize'

class Carts
  @cart = []

  def self.add_to_cart(cart_items)
    # Push selected item into cart
    @cart.push(cart_items).flatten!
  end

  def self.view_cart
    puts 'Products in Shopping Cart:'.colorize(:light_green)
    puts ' '
    # Check if the cart is empty
    empty_cart
    # Loop through item in the shopping can display it to the user
    @cart.each_with_index do |item, index|
      puts "#{index + 1}: " + "#{item.name} | $#{'%.2f' % item.price}".colorize(:yellow)
    end
    subtotal
    puts ' '
    discount
    puts ' '
    puts "Total: $#{@total}".colorize(:light_green)
    puts ' '
  end

  def self.checkout
    # Check out method
    if @cart.length == 0
      puts "Seem like you didn't buy anything today but please come again 😁"
      exit
    else
      view_cart
      puts "You've spent $#{@total} today, thank you for shopping at Best Bike!".colorize(:green)
      puts ' '
      exit
    end
  end

  def self.empty_cart
    # Handle case when case is empty
    puts 'Your shopping cart is empty!!'.colorize(:red) if @cart.length == 0
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
      puts "Discount Applied: #{'10% off on total greater than $20'.colorize(:yellow)}"
      @total = (@subtotal * over20).round(2)
    when 50..100
      puts "Discount Applied: #{'15% off on total greater than $50'.colorize(:yellow)}"
      @total = (@subtotal * over50).round(2)
    else
      puts "Discount Applied: #{'20% off on total greater than $100'.colorize(:yellow)}"
      @total = (@subtotal * over100).round(2)
    end
  end
end
