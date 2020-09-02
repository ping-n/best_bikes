require 'tty-prompt'
require 'colorize'
require_relative '../models/Product'
require_relative './carts'

class Products
  def self.view_all_products
    # Assigning variable
    prompt = TTY::Prompt.new
    options = {}
    # Saving all the exiting Products in a variable
    products = Product.product_map
    # Loop through Products with index
    products.each_with_index do |item, index|
      # Store each product info as a key and product uuid as value
      options.store("#{index + 1}: " + "#{item.name} | $#{item.price}".colorize(:yellow), item.uuid)
    end

    # Save product uuid from user into an array
    user_selection = prompt.multi_select('Please select a product to add to cart', options, active_color: :green)

    # Grab the item that matched user's selection item uuid
    cart_items = products.select do |item|
      user_selection.include? item.uuid
    end

    # Add selected products to Carts
    Carts.add_to_cart(cart_items)
  end
end
