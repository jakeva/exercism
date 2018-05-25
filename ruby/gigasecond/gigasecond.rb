class Gigasecond
  def self.from(time)
    Time.at(time.to_i + 1000000000) 
  end
end

module BookKeeping
  VERSION = 6 # Where the version number matches the one in the test.
end
