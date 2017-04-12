#!/bin/env ruby
# encoding: UTF-8
#
# Web-application base blackjack
#
# Author:: Anastasiya Diachenko (mailto:anastasiya.a.diachenko@gmail.com)
#

require 'sinatra'
require 'slim'
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
    logger.warn "Attempt of use choice task_card with state #{@game.state}"
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
      @game.change_state(FirstDealState)
      redirect to('/')
    end
  else
    logger.warn "Attempt of use choice bet with state #{@game.state}"
  end
end

get '/double_bet' do
  @game = Game.instance
  if @game.has_choice? :double_bet
    @game.double_bet
  else
    logger.warn "Attempt of use choice double_bet with state #{@game.state}"
  end

  redirect to('/')
end

get '/new_game' do
  @game = Game.instance
  if @game.has_choice? :new_game
    @game.change_state(StartState)
  else
    logger.warn "Attempt of use choice start_game with state #{@game.state}"
  end
  redirect to('/')
end

get '/restart_game' do
  @game = Game.instance
  if @game.has_choice? :restart_game
    @game.restart_game
  else
    logger.warn "Attempt of use choice restart_game with state #{@game.state}"
  end
  redirect to('/')
end

get '/stop' do
  @game = Game.instance
  if @game.has_choice? :stop
    @game.change_state(StopState)
  else
    logger.warn "Attempt of use choice stop with state #{@game.state}"
  end
  redirect to('/')
end
