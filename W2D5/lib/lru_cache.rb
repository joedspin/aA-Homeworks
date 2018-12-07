require 'byebug'

class LRUCache
  attr_accessor :size
  def initialize(cache_size = 4)
    @size = cache_size
    @arr_cache = []
  end

  def count
    @arr_cache.length
    # returns number of elements currently in cache  
  end

  def add(el)
    # adds element to cache according to LRU principle
    exists = @arr_cache.find_index(el)
    if exists
      @arr_cache.push(@arr_cache.slice!(exists))
    else
      if self.count == @size && self.count != 0
        @arr_cache.shift
      end
      @arr_cache.push(el)
    end
  end

  def [](idx)
    @arr_cache[idx]
  end

  def show
    return @arr_cache
    started = false
    @arr_cache.map do |el| 
      print ", " if started 
      print el
      started = true
    end
    puts
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!
end