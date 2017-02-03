class MinMaxStack
  attr_reader :max, :min
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    @store.pop
  end

  def push(el)
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min

    hash = create_hash(el)
    @store.push(hash)
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

  def create_hash(value)
    hash = {
      :val => value,
      :max => @max,
      :min => @min
    }
  end
end
