require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/category.rb')

get '/categories' do
  @categories = Category.all
  erb (:"categories/index")
end

get '/categories/new' do
  erb(:"categories/new")
end

post '/categories' do
  category = Category.new(params)
  category.save
  redirect to("/categories")
end

post '/categories/:id/delete' do
  Category.delete(params[:id])
  redirect to("/categories")
end
