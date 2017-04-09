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
  if @game.has_choice? :take_card
    @game.take_card(@game.player)
  else
    logger.warn "Try to use choice task_card with state #{@game.state}"
  end
  redirect to('/')
end

get '/bet' do
  @game = Game.instance
  if @game.has_choice? :bet
    @error = @game.make_bet(params[:bet].to_i)
    if @error.is_a? String
      logger.error @error
      slim :index
    else
      @game.start_game
      redirect to('/')
    end
  else
    logger.warn "Try to use choice bet with state #{@game.state}"
  end
end

get '/double_bet' do
  @game = Game.instance
  if @game.has_choice? :double_bet
    @game.double_bet
  else
    logger.warn "Try to use choice double_bet with state #{@game.state}"
  end

  redirect to('/')
end

get '/new_game' do
  @game = Game.instance
  if @game.has_choice? :new_game
    @game.start_game
  else
    logger.warn "Try to use choice start_game with state #{@game.state}"
  end
  redirect to('/')
end

get '/restart_game' do
  @game = Game.instance
  if @game.has_choice? :restart_game
    @game.restart_game
  else
    logger.warn "Try to use choice restart_game with state #{@game.state}"
  end
  redirect to('/')
end

get '/stop' do
  @game = Game.instance
  if @game.has_choice? :stop
    @game.change_state(StopState)
  else
    logger.warn "Try to use choice stop with state #{@game.state}"
  end
  redirect to('/')
end
