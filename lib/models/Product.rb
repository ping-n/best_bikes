require 'json'

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

  # Instance Method to change value of each Product instance
  def update_name(new_name)
    @name = new_name
  end

  def update_price(new_price)
    @price = new_price
  end
end
