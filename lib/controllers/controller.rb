require_relative '../view/Menu'
require_relative '../models/Product'

class Controller
  def initialize
    @menu = Menu.new
    @product = Product
  end

  def run
    @menu.display_menu
  end

  def add_products(new_product)
    @product.add_products(new_product)
  end
end
