require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, 'key'

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player1 = $player1.name
    @player2 = $player2.name
    @player1hp = 100
    @player2hp = 100
    @attack_confirmation = session[:attack_confirmation]
    erb(:play)
  end

  post '/names' do
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect '/play'
  end

  post '/attack' do
    session[:attack_confirmation] = "You've attacked #{$player2.name}!"
    redirect '/play'
  end

  run! if app_file == $0
end
