class Hand
  attr_accessor :cards

  def initialize(cards: [])
    @cards = cards
  end

  def add_card(card)
    @cards << card
  end

  def discard_cards!
    @cards = []
  end

  def bust?
    total > 21
  end

  def pair?
    cards.size == 2 && cards[0] == cards[1]
  end

  def pair_value
    cards.first.value
  end

  def total
    cards.sum(&:value)
  end

  def clone
    Hand.new(cards: @cards)
  end

  #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  # A hand is Soft when there is an Ace counting as 11. It's named such because you can't bust: you have one layer of protection.
  # For example, suppose you have an Ace and a Six. This score is a Soft 17. If you hit and pull a Ten, you don't bust but rather your Ace magically switches from 11 to 1. With the Ten added, the hand is now a Hard 17.

  # A hand is Hard or "stiff" when you have no layer of protection and therefore you are in jeopardy of busting if you draw a big card. This can happen a couple of different ways: Every Ace in your hand is already counting as 1 (not 11). The Ace can't magically switch to 1 to protect you, because it already is 1. You have no Aces in hand at all. A Ten plus a Seven is a Hard 17, because there's no flexibility here. Those numbers can't magically take on a smaller value at your convenience.
  #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  def soft?
    cards.any?(&:soft_ace?)
  end

  def mark_as_hard!
    cards.filter(&:soft_ace?).each(&:mark_as_hard!)
  end

  def to_s
    "#{cards.map(&:to_s).join(", ")} (Total: #{total})"
  end
end