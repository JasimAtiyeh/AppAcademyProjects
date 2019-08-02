require "byebug"

require_relative 'card.rb'

class Board
    attr_reader :grid

    def initialize
        @values = []
        @grid = Array.new(4){ Array.new(4) }
    end

    
    def populate
        (grid.length * 2).times do
            current_card = Card.new 
            if !@values.include?(current_card.value)
                @values << current_card.value
                2.times do
                    pos_1 = rand(0..3)
                    pos_2 = rand(0..3)
                    position = [pos_1, pos_2]
                    
                    if self[position].nil?
                        self[position] = current_card
                    else
                        redo
                    end 
                end
            else
                redo
            end
        end
    end

    def render
        self.grid.each do |row|
            row.each do |card|
                if card.face_up == true
                    card.hide
                else
                    card.reveal
                end
            end
        end
    end

    def won?
    end

    def reveal
    end


    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, card)
        @grid[position[0]][position[1]] = card
    end

end