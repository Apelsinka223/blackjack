#!/bin/env ruby
# encoding: UTF-8

require 'sinatra'
require 'slim'
require 'singleton'
require 'logger'

Dir['./lib/*.rb'].each { |file| load file }
Dir['./lib/states/*.rb'].each { |file| load file }


configure do
  file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
  file.sync = true
  use Rack::CommonLogger, file
end


get '/' do
  @game = Game.instance
  logger.debug @game.inspect
  slim :index
end

get '/take_card' do
  @game = Game.instance
  @game.take_card(@game.player)
  redirect to('/')
end

get '/bet' do
  @game = Game.instance
  @error = @game.make_bet(params[:bet].to_i)
  if @error.is_a? String
    logger.error @error
    slim :index
  else
    @game.start_game
    redirect to('/')
  end

end

get '/double_bet' do
  @game = Game.instance
  @game.double_bet
  redirect to('/')
end

get '/new_game' do
  @game = Game.instance
  @game.start_game
  redirect to('/')
end

get '/restart_game' do
  @game = Game.instance
  @game.restart_game
  redirect to('/')
end

get '/stop' do
  @game = Game.instance
  @game.change_state(StopState)
  redirect to('/')
end
