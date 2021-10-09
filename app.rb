require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end


get '/' do
  'chitter feed'
end 

get '/peeps/new' do 
  erb :'peeps/new'
end

get '/peeps' do
  @peeps = Peep.all
    erb :'peeps/index'
end 

post '/peeps' do
  Peep.create(url: params[:url])
  redirect '/peeps'
end 

run! if app_file == $0
end