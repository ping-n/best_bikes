require_relative '../view/menu'
require_relative '../models/product'
require_relative '../models/cart'

class Controller
  def initialize
    @cart = Cart.new
    @menu = Menu.new(@cart)
    @product = Product
  end

  def run
    @menu.display_menu
  end
end
