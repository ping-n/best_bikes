require 'colorize'

class Cart
  attr_accessor :total, :subtotal, :shopping_cart
  def initialize
    @shopping_cart = []
    @total = 0
    @subtotal = 0
  end

  # Added purchased Products and push to cart array
  def add_to_cart(cart_items)
    # Push selected item into cart
    @shopping_cart.push(cart_items).flatten!
  end

  # View current products inside the cart
  def view_cart
    puts 'Products in Shopping Cart:'.colorize(:light_green)
    puts ' '
    # Check if the cart is empty
    empty_cart
    # Loop through item in the shopping can display it to the user
    @shopping_cart.each_with_index do |item, index|
      puts "#{index + 1}: " + "#{item.name} | $#{'%.2f' % item.price}".colorize(:yellow)
    end
    subtotal
    puts ' '
    discount
    # ternary operator for discount message to only appear when cart have item inside
    @shopping_cart.length == 0 ? nil : discount_message
    puts ' '
    puts "Total: $#{@total}".colorize(:light_green)
    puts ' '
  end

  # Check out method
  def checkout
    if @shopping_cart.length == 0
      puts "Seem like you didn't buy anything today but please come again 😁".colorize(:green)
      exit
    else
      view_cart
      puts "You spent $#{@total} today, thank you for shopping at Best Bike!".colorize(:green)
      puts ' '
      exit
    end
  end

  # Handle case when case is empty
  def empty_cart
    puts 'Your shopping cart is empty!!'.colorize(:red) if @shopping_cart.length == 0
  end

  # Find out the subtotal before applying the discount
  def subtotal
    # Map through the cart, output the price to a float
    cart_subtotal = @shopping_cart.map do |item|
      item.price.to_f
    end
    # Sum of price from cart and save to the subtotal variable
    @subtotal = cart_subtotal.reduce(0) { |sum, n| sum + n }
  end

  # Apply Discount and assigned cart total price
  def discount
    # Discount conditions
    over20 = 0.9
    over50 = 0.85
    over100 = 0.8

    # Applying the discounts
    @total = case @subtotal
             when 0..20
               @subtotal
             when 20..50
               (@subtotal * over20).round(2)
             when 50..100
               (@subtotal * over50).round(2)
             else
               (@subtotal * over100).round(2)
             end
  end

  # Render discount message to terminal
  def discount_message
    case @subtotal
    when 0..20
      puts "Discount Applied: #{'No discount was applied'.colorize(:yellow)}"
    when 20..50
      puts "Discount Applied: #{'10% off on total greater than $20'.colorize(:yellow)}"
    when 50..100
      puts "Discount Applied: #{'15% off on total greater than $50'.colorize(:yellow)}"
    else
      puts "Discount Applied: #{'20% off on total greater than $100'.colorize(:yellow)}"
    end
  end
end
