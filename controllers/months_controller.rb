require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/month.rb')
require_relative('../models/transaction.rb')

# INDEX route
get '/months' do
  @months = Month.all
  erb(:"months/index")
end

# SHOW route
get '/months/:id' do
  @month = Month.find(params[:id])
  @categories = Category.all
  erb(:"months/show")
end
