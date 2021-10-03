require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end


get '/' do
  'chitter feed'
end 

get '/peep' do
  @peep = [
    "make a post",
    "first post",
    "I love coding"
  ]
    erb :index
end 

run! if app_file == $0
end