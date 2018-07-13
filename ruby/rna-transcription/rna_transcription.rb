class Complement
  def self.of_dna(a)
    return '' unless /^[GCAT]*$/.match(a)

    (0..a.length-1).each do |i|
      case a[i]
        when 'G'
          a[i] = 'C'
        when 'C'
          a[i] = 'G'
        when 'T'
          a[i] = 'A'
        when 'A'
          a[i] = 'U'
        else
          a[i] = ''
      end
    end
    a
  end
end

module BookKeeping
  VERSION = 4 # Where the version number matches the one in the test.
end
