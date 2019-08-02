class Card
    VALUES = ["L", "D", "R", "B", "U", "H", "J", "F"]

    attr_reader :value
    attr_accessor :face_up
    
    def initialize
        @value = VALUES.sample
        @face_up = false
    end

    def hide
        if face_up == true
            p "banana"
            @face_up = false
        end
    end

    def reveal
        if face_up == false
            print "#{@value}"
            @face_up = true
        else
            print "Card is already revealed"
        end
    end

    def ==(other_card)
        self.value == other_card.value
    end
end