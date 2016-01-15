require_relative 'stacks_and_queues'

def naive_window(array, window_size)
  current_max_range = 0
  (0..array.length - window_size).each do |i|
    current_diff = array[i, window_size].max - array[i, window_size].min
    current_max_range = current_diff if current_diff > current_max_range
  end
  current_max_range
end


def awesome_window(array, window_size)
  stack_queue = StackQueue.new
  window_size.times do |el|
    stack_queue.enqueue(array[el])
  end
  current_max_range = stack_queue.max - stack_queue.min
  (window_size...array.length).each do |index|
    stack_queue.enqueue(array[index])
    stack_queue.dequeue
    if stack_queue.max - stack_queue.min > current_max_range
      current_max_range = stack_queue.max - stack_queue.min
    end
  end
  current_max_range
end
