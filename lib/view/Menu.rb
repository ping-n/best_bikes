require 'tty-prompt'
require 'json'

require_relative '../controllers/products'
require_relative '../controllers/carts'

class Menu
  def self.run
    system('clear')
    puts 'Welcome to Best Bikes!'
    loop do
      prompt = TTY::Prompt.new

      user_selection = prompt.select('Please select from the following options', active_color: :cyan) do |menu|
        # Menu choices
        menu.choice 'View Products', 1
        menu.choice 'View Shopping Cart', 2
        menu.choice 'Check out', 3
        menu.choice 'Exit Application', 4
      end

      case user_selection
      when 1
        system('clear')
        Products::view_all_products
      when 2
        system('clear')
        Carts::view_cart
      when 3
        system('clear')
        Carts::checkout
      when 4
        system('clear')
        puts 'Thanks for visiting Best Bikes 👋👋'
        exit
        end
    end
  end
end
