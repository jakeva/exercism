class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase
  end
  
  def word_count
    @phrase
      .scan(/\b[\w']+\b/)
      .reduce(Hash.new(0)) do |hash, word| 
        hash[word] += 1
        hash
      end
  end
end
