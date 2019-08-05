class Map
    def initialize
        @map = []
    end

    def set(key, value)
        if @map.include?(key)
            @map.delete(key)
            puts "The key already exists in the map. Updating map with new value."
            @map << [key, value]
        else
            @map << [key, value]
        end
    end

    def get(key)
        @map.each { |set| puts set[1] if set[0] == key }
    end

    def delete(key)
        @map.each.with_index { |set, idx| @map[idx] = [] if set[0] == key }
    end

    def show
        @map.each { |set| print set }
    end
end

family = Map.new
family.set("noalle", "wife")
family.set("nijim", "son")
family.set("mohammed", "father")
family.set("becky", "mother")
family.set("jasim", "me")
family.show
family.get("nijim")
family.delete("jasim")
family.show
family.set("jasim", "me")
family.set("jasim", "me")
family.show