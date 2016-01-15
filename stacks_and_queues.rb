class MyQueue
  def initialize
    @store = []
  end

  def enqueue(val)
    @store << val
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  def initialize
    @store = []
    @max_stack = []
    @min_stack = []
  end

  def pop
    if peek == @max_stack.last
      @max_stack.pop
    end

    if peek == @min_stack.last
      @min_stack.pop
    end

    @store.pop
  end

  def push(val)
    @store << val
    @max_stack << val if @max_stack.empty? || val >= @max_stack.last
    @min_stack << val if @min_stack.empty? || val <= @min_stack.last
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    @max_stack.last
  end

  def min
    @min_stack.last
  end

end

class StackQueue

  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(val)
    @stack1.push(val)
  end

  def dequeue
    until @stack1.empty?
      @stack2.push(@stack1.pop)
    end
    output = @stack2.pop
    until @stack2.empty?
      @stack1.push(@stack2.pop)
    end
    output
  end

  def size
    @stack1.size
  end

  def empty?
    @stack1.empty?
  end

  def peek
    @stack1.first
  end

  def max
    @stack1.max
  end

  def min
    @stack1.min
  end
end
