require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/month.rb')

get '/months' do
  @months = Month.all
  erb(:"months/index")
end
