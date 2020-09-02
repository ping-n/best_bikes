require 'json'
require 'optparse'
require_relative './controllers/controller'

options = {}
OptionParser.new do |opts|
  opts.on('-a', '--admin ADMIN', 'Admin Mode') { |o| options['admin'] = o }
  opts.on('-u', '--uuid UUID', 'The uuid of product') { |o| options['uuid'] = o.to_i }
  opts.on('-n', '--name NAME', 'The name of product') { |o| options['name'] = o }
  opts.on('-p', '--price PRICE', 'The price of product') { |o| options['price'] = o }
  opts.on_tail('-h', '--help', 'Show this message') do
    puts opts
    exit
  end
end.parse!

app = Controller.new
# Starting point of the application
app.run
