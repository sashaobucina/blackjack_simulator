class WinResult
  def initialize(winner)
    @winner = winner
  end

  def tie?
    @winner == :tie
  end

  def player_won?
    @winner == :player
  end

  def dealer_won?
    @winner == :dealer
  end
end