require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end


get '/' do
  'chitter feed'
end 

get '/peeps' do
  @peeps = Peep.all
    erb :'peeps/index'
end 

get '/peeps/new' do 
  erb :'peeps/new'
end

post '/peeps' do
  url = params['url']
  connect =PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (url) VALUES('#{url})")
  redirect '/peeps'
end 

run! if app_file == $0
end