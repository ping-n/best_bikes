require 'tty-prompt'
require 'json'
require 'artii'
require 'colorize'

require_relative '../models/product'
require_relative '../models/cart'

class Menu
  def initialize(cart)
    @cart = cart
  end

  # Run the application
  def display_menu
    a = Artii::Base.new font: 'slant'

    system('clear')
    puts a.asciify('Best Bikes').colorize(:light_green)
    puts 'Welcome to Best Bikes!'.colorize(:green)
    loop do
      prompt = TTY::Prompt.new

      user_selection = prompt.select('Please select from the following options', active_color: :green) do |menu|
        # Menu choices
        menu.choice 'View Products', 1
        menu.choice 'View Shopping Cart', 2
        menu.choice 'Check out', 3
        menu.choice 'Exit Application', 4
      end

      menu_selection(user_selection)
    end
  end

  # Main Menu
  def menu_selection(user_selection)
    case user_selection
    when 1
      system('clear')
      Product.view_all_products(@cart)
    when 2
      system('clear')
      @cart.view_cart
    when 3
      system('clear')
      @cart.checkout
    when 4
      system('clear')
      puts ' '
      puts 'Thanks for visiting Best Bikes 👋👋'.colorize(:green)
      puts ' '
      exit
    end
  end
end
