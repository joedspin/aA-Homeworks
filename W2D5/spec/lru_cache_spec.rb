require 'rspec'
require 'lru_cache'

describe LRUCache do

  subject(:test_cache) { LRUCache.new(4) }

  describe "#initialize" do
    it "creates a new instance with size of 4" do
      expect(test_cache.size).to be(4)
    end
  end

  let(:compare_cache) { ["string", 3, 4, 5] }
  
  describe "#add(el)" do
    it "adds an element to the top of the cache when the cache is empty" do
      test_cache.add('string')
      expect(test_cache[0]).to eq('string')
    end

    it "adds successive elements in the correct order" do
      test_cache.add('string')
      test_cache.add(3)
      test_cache.add(4)
      test_cache.add(5)
      expect(test_cache.show).to eq(compare_cache)
    end


    it "expires older items in favor of newer ones" do
      test_cache.add('string')
      test_cache.add(3)
      test_cache.add(4)
      test_cache.add(5)
      test_cache.add('text')
      test_cache.add(2)
      expect(test_cache.show).to eq([4, 5, "text", 2])
    end

    it "moves an existing item to the end of the queue" do
      test_cache.add('string')
      test_cache.add(3)
      test_cache.add(4)
      test_cache.add(5)
      test_cache.add('string')
      expect(test_cache.show).to eq([3, 4, 5, "string"])
    end
  end

end