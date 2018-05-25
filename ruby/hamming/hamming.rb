class Hamming
  def self.compute (a, b)
    raise ArgumentError if a.length != b.length
    
    count = 0
    for i in 0..a.length
      count += 1 if a[i] != b[i]
    end
    
    count
  end
end

module BookKeeping
  VERSION = 3
end
