
# Web framework
require('sinatra')
require('sinatra/contrib/all') if development?

# Relevant controllers
require_relative('controllers/transactions_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/months_controller')

# Main root only here!
get '/' do
  redirect to("/transactions")
end
