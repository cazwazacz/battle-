require 'sinatra/base'

class Battle < Sinatra::Base

  enable :sessions
  
  get '/' do
    erb(:index)
  end

  get '/play' do
    p session
    @player1 = session[:player1]
    @player2 = session[:player2]
    erb(:play)
  end

  post '/names' do
    session[:player1] = params[:player1]
    session[:player2] = params[:player2]
    redirect '/play'
  end

  run! if app_file == $0
end
