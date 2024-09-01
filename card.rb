class Card
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def ace?
    @value == 11
  end

  def to_s
    @value.to_s
  end
end