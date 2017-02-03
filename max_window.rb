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
    @push_stack = Stack.new
    @pop_stack = Stack.new
  end

  def enqueue(el)
    @push_stack.push(el)
  end

  def dequeue
    if @pop_stack.empty?
      until @push_stack.empty?
        @pop_stack.push(@push_stack.pop)
      end
    end
      @pop_stack.pop
  end
end

#
#
# def optimized_range(array, w)
#
# end
#
# p optimized_range([1, 0, 2, 5, 4, 8], 2) == 4
# p optimized_range([1, 0, 2, 5, 4, 8], 3) == 5
# p optimized_range([1, 0, 2, 5, 4, 8], 4) == 6
# p optimized_range([1, 3, 2, 5, 4, 8], 5) == 6
