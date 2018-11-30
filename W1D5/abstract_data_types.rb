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
