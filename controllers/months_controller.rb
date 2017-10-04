require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('../models/month.rb')
require_relative('../models/transaction.rb')

# INDEX route
get '/months' do
  @months = Month.all
  erb(:"months/index")
end

# SHOW routes
get '/months/this' do
  today = Date.today
  id = today.year * 12 + today.month
  redirect to("/months/#{id}")
end

get '/months/:id' do
  @month = Month.find(params[:id])
  @categories = Category.all
  erb(:"months/show")
end
