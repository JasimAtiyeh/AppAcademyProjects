require_relative 'bomb.rb'

class Board
    
    def initialize(size = 9)
        @flags
        @grid = Array.new(size) { Array.new(size) }
        @size = size
    end

    def place_bombs
        num_of_bombs = @size * 2
        random_pos = [(0..@size).rand, (0..@size).rand]

        num_of_bombs.times { @grid[random_pos] = Bomb.new }
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

end