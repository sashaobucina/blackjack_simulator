require_relative "player_move"

class PlayerStrategy
  class << self
    def next_move(hand, upcard)
      if hand.total <= 4
        return PlayerMove.new(:hit)
      end

      action = if hand.pair?
        SPLIT_HAND_STRATEGY.fetch(hand.pair_value).fetch(upcard.value)
      elsif hand.soft?
        SOFT_HAND_STRATEGY.fetch(hand.total).fetch(upcard.value)
      else
        HARD_HAND_STRATEGY
          .fetch(hand.total)
          .fetch(upcard.value)
      end

      PlayerMove.new(action)
    end
  end

  HARD_HAND_STRATEGY = {
    5 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    6 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    7 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    8 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    9 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    10 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    11 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    12 => { 2 => :hit, 3 => :hit, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    13 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    14 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    15 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    16 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    17 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :stay, 10 => :stay, 11 => :stay },
    18 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :stay, 10 => :stay, 11 => :stay },
    19 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :stay, 10 => :stay, 11 => :stay },
    20 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :stay, 10 => :stay, 11 => :stay },
    21 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :stay, 10 => :stay, 11 => :stay }
  }

  SOFT_HAND_STRATEGY = {
    13 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    14 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    15 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    16 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    17 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    18 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :hit, 10 => :hit, 11 => :hit },
    19 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :stay, 10 => :stay, 11 => :stay },
    20 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :stay, 10 => :stay, 11 => :stay },
    21 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :stay, 10 => :stay, 11 => :stay }
  }

  SPLIT_HAND_STRATEGY = {
    2 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    3 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    4 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :split, 6 => :split, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    5 => { 2 => :hit, 3 => :hit, 4 => :hit, 5 => :hit, 6 => :hit, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    6 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :hit, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    7 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :hit, 9 => :hit, 10 => :hit, 11 => :hit },
    8 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :stay, 11 => :stay },
    9 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :stay, 8 => :split, 9 => :split, 10 => :stay, 11 => :stay },
    10 => { 2 => :stay, 3 => :stay, 4 => :stay, 5 => :stay, 6 => :stay, 7 => :stay, 8 => :stay, 9 => :stay, 10 => :stay, 11 => :stay },
    11 => { 2 => :split, 3 => :split, 4 => :split, 5 => :split, 6 => :split, 7 => :split, 8 => :split, 9 => :split, 10 => :split, 11 => :split }
  }
end