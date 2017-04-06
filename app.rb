require 'sinatra'
require 'slim'
require 'singleton'

Dir['./lib/*.rb'].each {|file| load file }
Dir['./lib/states/*.rb'].each {|file| load file }

set :partial_template_engine, :slim
enable :partial_underscores

get '/' do
  @game = Game.instance
  slim :index
end
