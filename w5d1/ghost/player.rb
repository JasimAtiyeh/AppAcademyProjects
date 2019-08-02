class Player
    def initialize(name)
        @name = name
    end

    def guess
        alphabet = ("a".."z").to_a
        
        begin
            print "#{@name}, please enter a letter: "
            guess = gets.chomp
            raise  if !alphabet.include?(guess)
        rescue   
            p 'Invalid guess'   
            retry
        end
    end
end