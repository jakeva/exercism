class Squares
  attr_reader :num

  def initialize(a)
    @num = a
  end

  def square_of_sum
    sum = (1..num).reduce(&:+)
    sum**2
  end

  def sum_of_squares
    squares = (1..num).map{|n| n * n}.reduce(&:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 4 # Where the version number matches the one in the test.
end