class Stack
    def initialize
      # create ivar to store stack here!
      @ivar = []
    end

    def push(el)
      # adds an element to the stack
      @ivar << el
    end

    def pop
      # removes one element from the stack
      @ivar.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @ivar.last
    end
  end

  class Queue
    def initialize
        #create ivar to store queue here!
        @ivar = []
    end

    def enqueue(el)
        #adds an element to the queue
        @ivar << el
    end
    
    def dequeue
        #removes one elements from the queue
        @ivar.shift
    end

    def peek
        #returns, but doesn't remove, the bottom element in the queue
        @ivar.first
    end
  end

# Define a Map class with the following instance methods:
# set(key, value), get(key), delete(key), show

class Map
    def initialize
      # create ivar to store stack here!
      @ivar = Array.new { Array.new(2) }
    end

    def set(key, value)
      # adds an element to the map
      check_key = key_position(key)
      if check_key.nil?
        @ivar << [key,value]
      else
        @ivar[check_key,1] = value
      end
    end

    def key_position(key)
      @ivar.each_with_index { |el, i| return i if el[0] == key}
      nil
    end

    def get(key)
      # return the value stored at the key location
      check_key = key_position(key)
      if check_key.nil?
        nil
      else
        @ivar[check_key, 1]
      end
    end

    def delete(key)
      # returns, but doesn't remove, the top element in the stack
      check_key = key_position(key)
      unless check_key.nil?
        @ivar[check_key].delete
      end
    end

    def show
    # why do they tell us they need this method
    # but not explain what it is supposed to do?
    p @ivar
    end
  end