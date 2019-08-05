class Stack
    def initialize
      @stack = []
    end

    def push(el)
      @stack << el
    end

    def pop
      @stack.pop
    end

    def peek
      return @stack.last
    end
  end

  p stack1 = Stack.new
  stack1.push("jasim")
  stack1.push("noalle")
  stack1.push("nijim")
  p stack1
  p stack1.peek