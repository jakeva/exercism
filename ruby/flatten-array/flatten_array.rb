class FlattenArray
  def self.flatten(array)
    array.flatten.compact
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
