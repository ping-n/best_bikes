require_relative "../view/Menu"
require_relative "../models/Product"

class Controller
  def initialize
    @menu = Menu.new
  end

  def run
    @menu.display_menu
  end 
end