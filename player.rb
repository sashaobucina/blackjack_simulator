require_relative "hand"

class Player
  attr_accessor :hands

  def initialize(dealer: false)
    @dealer = dealer
    @hands = [Hand.new]
  end

  def add_hand(hand)
    @hands << hand
  end

  def reset!
    self.hands = [Hand.new]
  end

  def bust?
    @hands.all?(&:bust?)
  end
end