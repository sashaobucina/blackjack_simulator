class PlayerMove
  attr_reader :variant

  def initialize(variant)
    @variant = variant
  end

  def stay?
    variant == :stay
  end

  def hit?
    variant == :hit
  end

  def split?
    variant == :split
  end

  def to_s
    variant.to_s.capitalize
  end
end