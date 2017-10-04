
require('sinatra')
require('sinatra/contrib/all') if development?

require_relative( '../models/transaction.rb' )
# transaction -> category, month -> model -> SqlRunner

# INDEX route
get '/transactions' do
  @transactions = Transaction.all
  erb(:"transactions/index")
end

# NEW route
get '/transactions/new' do
  @categories = Category.all
  erb(:"transactions/new")
end

# SHOW route
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

# EDIT route
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @categories = Category.all
  erb(:"transactions/edit")
end

# CREATE route
post '/transactions' do
  Transaction.new(params).save
  redirect to("/transactions")
end

# UPDATE route
post '/transactions/:id' do
  Transaction.new(params).save
  redirect to "/transactions/#{params[:id]}"
end

# DELETE route
post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to("/transactions")
end
