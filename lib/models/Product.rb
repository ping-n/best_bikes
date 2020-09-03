require 'json'
require 'tty-prompt'
require 'colorize'
require_relative './cart'

class Product
  attr_accessor :name, :price
  attr_reader :uuid

  # Initialize new Product instance with the following attributes
  def initialize(uuid, name, price)
    @uuid = uuid
    @name = name
    @price = price
  end

  # Called the get_products and create a new Product instance for each product in the JSON file
  # Output each product to the terminal
  def self.product_map
    get_products.map do |product|
      Product.new(product['uuid'], product['name'], product['price'])
    end
  end

  # Get products from JSON file
  def self.get_products
    json_from_file = File.read(File.expand_path('../data/products.json', __dir__))
    JSON.parse(json_from_file)
  end

  # View all Products
  def self.view_all_products(cart)
    options = {}
    product_map.each_with_index do |item, index|
      # Store each product info as a key and product uuid as value in options
      options.store("#{index + 1}: " + "#{item.name} | $#{item.price}".colorize(:yellow), item.uuid)
    end
    pass_to_cart(options, cart)
  end

  # Pass purchased item to cart
  def self.pass_to_cart(options, cart)
    prompt = TTY::Prompt.new
    # Save product uuid from user into an array
    user_selection = prompt.multi_select('Please select a product to add to cart', options, active_color: :green)

    # Grab the item that matched user's selection item uuid
    cart_items = product_map.select do |item|
      user_selection.include? item.uuid
    end
    # Add selected products to Carts
    cart.add_to_cart(cart_items)
  end

  # Update name of Product
  def update_name(new_name)
    @name = new_name
  end

  # Update price of Product
  def update_price(new_price)
    @price = new_price
  end
end
