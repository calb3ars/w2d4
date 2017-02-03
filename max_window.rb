require_relative 'stack'

def windowed_max_range(array, window_size)
  current_max_range = 0

  array.each_cons(window_size) do |subarray|
    current_range = subarray.max - subarray.min
    current_max_range = current_range if current_range > current_max_range
  end

  current_max_range
end
#
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class StackQueue
  def initialize
    @push_stack = MinMaxStack.new
    @pop_stack = MinMaxStack.new
  end

  def enqueue(el)
    @push_stack.push(el)
  end

  def dequeue
    if @pop_stack.empty?
      fill
    end
      @pop_stack.pop
  end

  def fill
    until @push_stack.empty?
      @pop_stack.push(@push_stack.pop)
    end
  end

  def empty?
    @push_stack.empty? && @pop_stack.empty?
  end

  def peek
    fill
    @pop_stack.peek
  end


end

# p sq = StackQueue.new
# p sq.empty?
# p sq.enqueue(5)
# p sq.enqueue(7)
# p sq.enqueue(3)
# p sq.enqueue(4)
# p sq.enqueue(1)
# p sq.dequeue
# p sq.peek
# p sq.empty?


def optimized_range(array, w)
  my_stack_queue = StackQueue.new
  w.times do |i|
    my_stack_queue.enqueue(array.shift)
  end

  max_range = (my_stack_queue.max - my_stack_queue.min)

  until array.empty?
    my_stack_queue.pop
    my_stack_queue(array.shift)
    new_range = (my_stack_queue.max - my_stack_queue.min)
    max_range = new_range if new_range > max_range
  end

  max_range
end
#
p optimized_range([1, 0, 2, 5, 4, 8], 2) == 4
p optimized_range([1, 0, 2, 5, 4, 8], 3) == 5
p optimized_range([1, 0, 2, 5, 4, 8], 4) == 6
p optimized_range([1, 3, 2, 5, 4, 8], 5) == 6
