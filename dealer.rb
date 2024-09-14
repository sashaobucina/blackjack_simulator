require_relative "hand"

class Dealer
  attr_reader :hand, :stay_value

  def initialize(stay_value: 17)
    @hand = Hand.new
    @stay_value = stay_value
  end

  def can_hit?
    hand.total < stay_value
  end

  def bust?
    hand.bust?
  end

  def upcard
    if hand.cards.size == 0
      raise "Dealer has no cards"
    end

    hand.cards.first
  end

  def reset!
    @hand = Hand.new
  end
end