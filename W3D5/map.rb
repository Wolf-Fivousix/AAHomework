class Map
    def initialize
        @map = Array.new {[]}
    end

    def set(key, value)
        map.each do |key_value_pair|
            if key_value_pair.first == key
                key_value_pair[-1] = value
                return true
            end
        end
        # Key pair does not exist, make new.
        map.push([key, value])
        false
    end

    def get(key)
        map.select { |key_value_pair| return key_value_pair.last if key_value_pair.first == key}
        false
    end

    def delete(key)
        map.each.with_index { |key_value_pair, index| return map.delete_at(index) if key_value_pair.first == key }
        nil
    end

    def show
        map.each { |key_value_pair| p key_value_pair }
    end

    private
    attr_accessor :map
end

p map = Map.new
map.set(1, 1)
map.set(2, 4)
map.set(3, 9)
map.show
p map.get(3)
p map.delete(5)
p map.delete(2)
map.set(1, 111)
map.show