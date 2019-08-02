require_relative "dictionary.rb"
require_relative "player.rb"

class Game
    attr_accessor :fragment
    attr_reader :player_1
    
    def initialize(p_1_name, p_2_name)
        @player_1 = Player.new(p_1_name)
        @player_2 = Player.new(p_2_name)
        @fragment = "a"
        @dictionary = Dictionary.new
        @active_player
    end

    def current_player
        players = [@player_1, @player_2]
        @active_player = players.sample
    end

    def switch_player
        if @active_player == @player_1
            @active_player = @player_2
        else
            @active_player = @player_1
        end
    end

    def take_turn(player)
        player_guess = player.guess
        self.fragment += player_guess
        round_lose?(@fragment)
    end

    def round_lose?(frag)
       return true if  @dictionary.dictionary_game.include?(frag) && frag.length > 3
       false
    end

    def play_round
        while !round_lose?(@fragment)
            take_turn(active_player)
            switch_player
        end
    end
end