require 'set'
class Dictionary
    attr_reader :dictionary_game
    def initialize
        @dictionary_game = Set.new 
        create_dic
    end

    def create_dic
        File.open('dictionary.txt').each do |word|
            @dictionary_game.add(word.chomp)
        end
    end

    def include?(frag)
        @dictionary_game.include?(frag)
    end

end