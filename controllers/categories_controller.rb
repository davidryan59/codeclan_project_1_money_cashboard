require('sinatra') 
require('sinatra/contrib/all')

require_relative('../models/category.rb')

get '/categories' do
  @categories = Category.all
  erb (:"categories/index")
end
