require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/month.rb')

get '/months' do
  @months = Month.all
  erb(:"months/index")
end

get '/months/new' do
  erb(:"months/new")
end

post '/months' do
  month = Month.new(params)
  month.save
  redirect to("/months")
end

post '/months/:id/delete' do
  Month.delete(params[:id])
  redirect to("/months")
end
