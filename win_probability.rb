class WinProbability
  class << self
    def calculate(player_value, dealer_value)
      # TODO: Calculate for real
      if player_value > 21
        return 0.0
      elsif dealer_value > 21
        return 1.0
      elsif player_value > dealer_value
        return 0.75
      elsif player_value == dealer_value
        return 0.5
      else
        return 0.25
      end
    end
  end
end