# External Gems
require 'tty-prompt'
require 'json'

# Importing Class
require_relative '../controllers/ProductController'

class Menu

  def self.run
    system('clear')
    puts 'Welcome to Best Bikes!'
    loop do
      prompt = TTY::Prompt.new

      user_selection = prompt.select('Please select from the following options', active_color: :cyan) do |menu|
        menu.choice 'View Products', 1
        menu.choice 'View Shopping Cart', 2
        menu.choice 'Exit Application', 3
      end
      
    case user_selection
      when 1
        system('clear')
        ProductController.view_all_products
      when 2
        system('clear')
        begin
          puts "Products in Shopping Cart:"
          puts " "
          ProductController.view_cart
          puts " "
          ProductController.discount
          total = ProductController.total
          puts " "
          puts "Total: $#{total}"
        rescue => exception
          puts "Your shopping cart is empty!!"
          puts " "
        end
      when 3
        system('clear')
        puts 'Thank you for shopping at Best Bikes!'
        exit
      end
    end
  end
end