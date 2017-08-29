# Gems
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

# Dependencies
require_relative( '../models/transaction.rb' )
# transaction -> category, month -> model -> SqlRunner

get '/transactions' do
  @transactions = Transaction.all
  erb ( :"transactions/index" )
end

get '/transactions/new' do
  @categories = Category.all
  erb(:"transactions/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to("/transactions")
end

post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to("/transactions")
end
