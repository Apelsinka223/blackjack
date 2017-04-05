Dir['./lib/*.rb'].each {|file| require file }

get '/' do
  game = Game.new

  puts game.player.cards.inspect
  puts game.dealer.cards.inspect


end