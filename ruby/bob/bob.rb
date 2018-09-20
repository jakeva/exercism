class Bob
  def self.hey(remark)
    @remark = remark

    return "Fine. Be that way!" if @remark.gsub(/\s/, '').length == 0
    return "Calm down, I know what I'm doing!" if uppercase? && question?  
    return "Sure." if question?
    
    uppercase? ? "Whoa, chill out!" : "Whatever."
  end

  private
  
  def self.uppercase?
    @remark.count("a-zA-Z") > 0 && @remark == @remark.upcase
  end
  
  def self.question?
    @remark.gsub(/\s/, '')[-1] == '?'
  end
end

module BookKeeping
  VERSION = 2 # Where the version number matches the one in the test.
end
