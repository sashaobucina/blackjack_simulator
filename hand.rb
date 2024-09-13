class Hand
  attr_accessor :cards

  def initialize(cards: [])
    @cards = cards
  end

  def add_card(card)
    @cards << card
  end

  def reset!
    @cards = []
  end

  def bust?
    total > 21
  end

  def hard?
    @cards.none? { |card| card.ace? }
  end

  def soft?
    @cards.any? { |card| card.ace? }
  end

  def total
    cards.sum(&:value)
  end

  def clone
    Hand.new(cards: @cards)
  end
end