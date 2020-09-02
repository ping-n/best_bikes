require_relative "../view/Menu"

class Controller
  def initialize
    @menu = Menu.new
  end

  def run
    @menu.display_menu
  end
end