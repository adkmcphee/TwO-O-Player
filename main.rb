require_relative 'game'
require_relative 'players'
require_relative 'question'

puts "Enter the number of players:"
num_players = gets.chomp.to_i

game = Game.new(num_players)
game.start_game

