require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/category.rb')

# INDEX route
get '/categories' do
  @categories = Category.all
  erb(:"categories/index")
end

# NEW route
get '/categories/new' do
  erb(:"categories/new")
end

# SHOW route
get '/categories/:id' do
  @category = Category.find(params[:id])
  erb(:"categories/show")
end

# EDIT route
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb(:"categories/edit")
end

# CREATE route
post '/categories' do
  Category.new(params).save
  redirect to("/categories")
end

# UPDATE route
post '/categories/:id' do
  Category.new(params).save
  redirect to "/categories/#{params[:id]}"
end

# DELETE route
post '/categories/:id/delete' do
  Category.delete(params[:id])
  redirect to("/categories")
end
