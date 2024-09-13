require_relative "hand"

class Player
  attr_accessor :hand

  def initialize(dealer: false)
    @hand = Hand.new
    @dealer = dealer
  end

  def possible_hands
    hands = [Hand.new]

    hand.cards.each do |card|
      if card.ace?
        hands.each { |hand| hand.add_card(Card.new(11, "A")) }
        cloned_hands = hands.map(&:clone)
        cloned_hands.each { |hand| hand.add_card(Card.new(1, "A")) }

        hands = hands + cloned_hands
      else
        hands.each { |hand| hand.add_card(card) }
      end
    end

    hands
  end

  def reset!
    hand.reset!
  end

  def bust?
    @hand.bust?
  end

  def can_hit?
    player? ? true : hand.total < 17
  end

  def player?
    !dealer?
  end

  def dealer?
    @dealer
  end
end