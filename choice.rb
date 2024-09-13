require_relative "player_move"

class Choice
  HARD_HAND_STRATEGY = {
    5 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    6 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    7 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    8 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    9 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    10 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    11 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    12 => { 2 => :hit, 3 => :hit, 4 => :split, 5 => :split, 6 => :split, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    13 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    14 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    15 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    16 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    17 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :split, 11 => :split },
    18 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :split, 11 => :split },
    19 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :split, 11 => :split },
    20 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :split, 11 => :split },
    21 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :split, 11 => :split }
  }

  SOFT_HAND_STRATEGY = {
    13 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    14 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    15 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    16 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    17 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    18 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :hit, 10 => :hit, 11 => :hit },
    19 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :split, 11 => :split },
    20 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :split, 11 => :split },
    21 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :split, 11 => :split }
  }

  attr_reader :hand, :dealer_upcard

  def initialize(hand:, dealer_upcard:)
    @hand = hand
    @dealer_upcard = dealer_upcard
  end

  def best_move
    if hand.total <= 4
      return PlayerMove.new(:hit)
    end

    strategy = if hand.hard?
      HARD_HAND_STRATEGY
    else
      SOFT_HAND_STRATEGY
    end

    possible_actions = strategy.fetch(hand.total)
    action = possible_actions.fetch(dealer_upcard.value)

    PlayerMove.new(action)
  end
end