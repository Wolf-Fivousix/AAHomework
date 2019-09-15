 class LRUCache
    def initialize(size)
        @max_size = size
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      cache.length
    end

    def add(element)
      # adds element to cache according to LRU principle
      if cache.include?(element)
        cache.delete_at(cache.index(element))
      else
        cache.pop if cache.length == max_size
      end
      cache.unshift(element)
    end

    def show
      # shows the items in the cache, with the LRU item first
        reverse = cache.dup.reverse
        reverse.each { |element| p element }
    end

    private
    # helper methods go here!
    attr_reader :max_size
    attr_accessor :cache
  end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]