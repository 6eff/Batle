require 'sinatra/base'
# require 'spec_helper'
require_relative 'lib/player'
require './lib/game'

class Batle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :form
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    @game = Game.create(player1, player2)
    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    # @game = $game
    erb :play
  end

  post '/attack' do
    # @game = $game
    if @game.game_over?
      redirect '/game_over'
    else
      redirect "/attack"
    end
  end

  get '/attack' do
    # @game = $game
    @game.attack(@game.player2)
    @game.switch
    erb :attack
  end

  post "/switch" do
    @game.switch
    redirect "/play"
  end

  get "/game_over" do
    # @game = $game
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
