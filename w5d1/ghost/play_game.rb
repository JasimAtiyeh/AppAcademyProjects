require_relative "game.rb"


print "Enter in player 1's name: "
player_1_name = gets.chomp
print "Enter in player 2's name: "
player_2_name = gets.chomp

game = Game.new(player_1_name, player_2_name)

game.play_round