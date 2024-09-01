require_relative "choice"
require_relative "win_probability"

class PlayerStrategy
  class << self
    def next_move(game)
      choices = []
      hands = game.player.possible_hands

      hands.each do |hand|
        choices << Choice.new(
          action: :stay, win_probability: WinProbability.calculate(hand, game.dealer.sum)
        )

        choices << Choice.new(
          action: :hit, win_probability: WinProbability.calculate(hand + game.deck.peek.value, game.dealer.sum)
        )
      end

      best_choice = choices.max_by(&:win_probability)
      best_choice.move
    end
  end
end