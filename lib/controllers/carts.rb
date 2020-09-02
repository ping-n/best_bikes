module Carts
  @cart = []
  
  def self.add_to_cart(cart_items)
    #Push selected item into cart
    @cart.push(cart_items).flatten!
  end

  def self.view_cart
    puts 'Products in Shopping Cart:'
    puts ' '
    #Loop through item in the shopping can display it to the user
    empty_cart
    @cart.each_with_index do |item, index|
      puts "#{index + 1}: #{item.name} | $#{'%.2f' % item.price}"
    end
    subtotal
    puts ' '
    discount
    puts ' '
    puts "Total: $#{@total}"
    puts ' '
  end

  def self.checkout
    #Check out method
    if @cart.length == 0
      puts "Seem like you didn't buy anything today but please come again 😁"
      exit
    else
      view_cart
      exit
    end
  end

  def self.empty_cart
    #Handle case when case is empty
    if @cart.length == 0 
      puts 'Your shopping cart is empty!!'
    end
  end

  def self.subtotal
    #Map through the cart, output the price to a float
    cart_subtotal = @cart.map do |item|
      item.price.to_f
    end
    #Sum of price from cart and save to the subtotal variable
    @subtotal = cart_subtotal.reduce(0) { |sum, n| sum + n }
  end

  def self.discount
    #Discount conditions
    over20 = 0.9
    over50 = 0.85
    over100 = 0.8

    #Applying the discounts
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
end
