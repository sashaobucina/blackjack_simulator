class Card
  attr_reader :value, :symbol

  def initialize(value, symbol)
    @value = value
    @symbol = symbol
  end

  def ace?
    @value == 11
  end

  def to_s
    @symbol
  end
end