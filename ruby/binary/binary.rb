class Binary
  def self.to_decimal(num)
    i = 1
    result = 0
    while num.length > 0 do
      digit = num.slice!(-1)
      raise ArgumentError unless ['0', '1'].include? digit

      result += digit.to_i * i
      i = i * 2
    end
    result
  end
end