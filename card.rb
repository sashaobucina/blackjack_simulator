class Card
  attr_reader :value, :symbol

  def initialize(value, symbol)
    @value = value
    @symbol = symbol
  end

  def ace?
    @symbol == "A"
  end

  def soft_ace?
    ace? && value == 11
  end

  def to_s
    symbol
  end

  def ==(other)
    @symbol == other.symbol
  end

  def mark_as_hard!
    unless ace?
      raise "Only aces can be marked as soft, '#{self}' is not an ace"
    end

    @value = 1
  end
end