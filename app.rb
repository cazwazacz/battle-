require 'sinatra/base'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, 'key'

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player1 = session[:player1]
    @player2 = session[:player2]
    @player1hp = 100
    @player2hp = 100
    @attack_confirmation = session[:attack_confirmation]
    erb(:play)
  end

  post '/names' do
    session[:player1] = params[:player1]
    session[:player2] = params[:player2]
    redirect '/play'
  end

  post '/attack' do
    session[:attack_confirmation] = "You've attacked #{session[:player2]}!"
    redirect '/play'
  end

  run! if app_file == $0
end
