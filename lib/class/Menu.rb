require 'tty-prompt'

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
        puts 'View Products'
      when 2
        puts 'Current Shopping Cart'
      when 3
        puts 'Thank you for using our service!'
        exit
      else
        'Invalid selection, please select from the following options.'
      end
    end
  end
end