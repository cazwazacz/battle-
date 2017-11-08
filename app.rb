require 'sinatra/base'
require './lib/player'
require './lib/game'


class Battle < Sinatra::Base
  
  enable :sessions
  set :session_secret, 'key'

  get '/' do
    session[:attack_confirmation] = nil
    erb(:index)
  end

  get '/play' do
    @game = $game
    @attack_confirmation = session[:attack_confirmation]
    erb(:play)
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  post '/attack' do
    @game = $game
    @game.attack(@game.player2)
    session[:attack_confirmation] = "You've attacked #{@game.player2.name}!"
    redirect '/play'
  end

  run! if app_file == $0
end
