class Player
  attr_accessor :cards

  def initialize(dealer: false)
    @cards = []
    @dealer = dealer
  end

  def sum
    cards.sum(&:value)
  end

  # TODO: Implement `Hand` class to model possible hands
  def possible_hands
    sums = [0]

    cards.each do |card|
      if card.ace?
        sums_with_aces_as_one = sums.map { |sum| sum + 1 }
        sums_with_aces_as_eleven = sums.map { |sum| sum + 11 }

        sums = sums_with_aces_as_one + sums_with_aces_as_eleven
      else
        sums = sums.map { |sum| sum + card.value }
      end
    end

    sums
  end

  def reset!
    @cards = []
  end

  def bust?
    sum > 21
  end

  def can_hit?
    player? ? true : sum < 17
  end

  def player?
    !dealer?
  end

  def dealer?
    @dealer
  end
end