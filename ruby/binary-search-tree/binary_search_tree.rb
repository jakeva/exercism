class Bst
  attr_reader :data, :left, :right
  
  def initialize(num)
    @data = num
  end
  
  def insert(num)
    num <= data ? insert_left(num) : insert_right(num)
  end
  
  def each(&block)
    return enum_for(:each) unless block_given?
    
    left&.each(&block)
    yield data 
    right&.each(&block)
  end
  
  private
  
  def insert_left(num)
    if @left
      @left.insert(num)
    else
      @left = self.class.new(num)
    end
  end
  
  def insert_right(num)
    if @right
      @right.insert(num)
    else
      @right = self.class.new(num)
    end
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
