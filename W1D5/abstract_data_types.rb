
require "byebug"
class Stack
    def initialize
      # create ivar to store stack here!
      @arr_stack = []
    end

    def push(el)
      # adds an element to the stack
      arr_stack << el
    end

    def pop
      # removes one element from the stack
      arr_stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      arr_stack.last
    end

    private
    attr_accessor :arr_stack
  end

  class Queue
    def initialize
        #create ivar to store queue here!
        @arr_queue = []
    end

    def enqueue(el)
        #adds an element to the queue
        arr_queue << el
    end
    
    def dequeue
        #removes one elements from the queue
        arr_queue.shift
    end

    def peek
        #returns, but doesn't remove, the bottom element in the queue
        arr_queue.first
    end

    private
    attr_accessor :arr_queue
  end

# Define a Map class with the following instance methods:
# set(key, value), get(key), delete(key), show

class Map
    def initialize
      # create ivar to store stack here!
      @arr_map = Array.new { Array.new(2) }
    end

    def set(key, value)
      # adds an element to the map
      check_key = key_position(key)
      if check_key.nil?
        arr_map << [key,value]
      else
        arr_map[check_key][1] = value
      end
    end

    def key_position(key)
      arr_map.each_with_index { |el, i| return i if el[0] == key}
      nil
    end

    def get(key)
      # return the value stored at the key location
      check_key = key_position(key)
      if check_key.nil?
        nil
      else
        arr_map[check_key][1]
      end
    end

    def delete(key)
        debugger
      # returns, but doesn't remove, the top element in the stack
      arr_map.reject! { |el| el[0] == key }
    end

    def show
    # why do they tell us they need this method
    # but not explain what it is supposed to do?
      arr_map.each { |el| puts el[0].to_s + " => " + el[1].to_s}
    end

    private
    attr_accessor :arr_map

  end