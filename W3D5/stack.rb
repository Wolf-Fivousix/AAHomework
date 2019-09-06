class Stack
    def initialize
      @stack = []
    end

    def push(element)
      @stack.push(element)
    end

    def pop
      @stack.pop
    end

    def peek
      @stack.last
    end
  end

  my_stack = Stack.new
  my_stack.push(3)
  p my_stack
  my_stack.pop
  p my_stack