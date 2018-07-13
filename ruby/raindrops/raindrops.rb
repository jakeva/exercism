class Raindrops
  def self.convert(a)
    val = ''
    val += "Pling" if (a % 3 == 0)
    val += "Plang" if (a % 5 == 0)
    val += "Plong" if (a % 7 == 0)
    val = a.to_s if val == ''
    val
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
