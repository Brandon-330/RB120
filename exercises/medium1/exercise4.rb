class CircularQueue
  attr_reader :array

  def initialize(arr_size)
    @array = Array.new(arr_size)
  end

  def enqueue(num)
    array.pop if array[-1] != nil
    array.unshift(num)
  end

  def dequeue
    array.pop
  end

  def to_s
    "#{array}"
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
puts queue
queue.enqueue(2)
puts queue
puts queue.dequeue == 1

queue.enqueue(3)
puts queue
queue.enqueue(4)
puts queue
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil