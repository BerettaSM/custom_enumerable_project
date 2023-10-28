module Enumerable
  # Your code goes here
  def my_each_with_index &block
    (0...self.length).each do |index|
        block.call(self[index], index)
    end
    self
  end

  def my_select &block
    filtered = Array.new
    self.each do |item|
        filtered << item if block.call(item)
    end
    filtered
  end

  def my_all?
    self.each do |item|
        return false if !(yield item)
    end
    true
  end

  def my_any?
    self.each do |item|
        return true if yield item
    end
    false
  end

  def my_none?
    self.each do |item|
        return false if yield item
    end
    true
  end

  def my_count
    return self.length unless block_given?
    self.reduce(0) { |a, t| (yield t) ? a + 1 : a }
  end

  def my_map &block
    arr = Array.new
    self.each do |item|
        arr << block.call(item)
    end
    arr
  end

  def my_inject initial=nil, &block
    initial = initial ? initial : self[0]
    start = initial ? 0 : 1
    (start...self.length).each do |i|
        initial = block.call(initial, self[i])
    end
    initial
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each &block
    self.each do |e|
        block.call(e)
    end
    self
  end
end
