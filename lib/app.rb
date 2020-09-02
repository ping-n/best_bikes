require 'json'
require 'optparse'
require_relative './controllers/controller'

app = Controller.new
# Starting point of the application
app.run
