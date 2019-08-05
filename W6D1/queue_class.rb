class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
      @queue.unshift(el)
    end

    def pop
      @queue.pop
    end

    def peek
      return @queue.last
    end
  end

  queue = Queue.new
  queue.enqueue("jasim")
  queue.enqueue("noalle")
  queue.enqueue("nijim")
  p queue
  queue.pop
  p queue
  p queue.peek