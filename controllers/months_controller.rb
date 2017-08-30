require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/month.rb')
require_relative('../models/transaction.rb')

# INDEX route
get '/months' do
  @months = Month.all
  erb(:"months/index")
end

# # NEW route
# get '/months/new' do
#   erb(:"months/new")
# end

# SHOW route
get '/months/:id' do
  @month = Month.find(params[:id])
  erb(:"months/show")
end

# # EDIT route
# get '/months/:id/edit' do
#   @month = Month.find(params[:id])
#   erb(:"months/edit")
# end

# # CREATE route
# post '/months' do
#   Month.new(params).save
#   redirect to("/months")
# end

# # UPDATE route
# post '/months/:id' do
#   Month.new(params).save
#   redirect to "/months/#{params[:id]}"
# end

# # DELETE route
# post '/months/:id/delete' do
#   Month.delete(params[:id])
#   redirect to("/months")
# end
