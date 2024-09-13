require_relative "choice"
require_relative "win_probability"

class PlayerStrategy
  class << self
    def next_move(game)
      player_hand = game.player.hand
      dealer_upcard = game.dealer.hand.cards.first

      choice = Choice.new(
        hand: player_hand,
        dealer_upcard: dealer_upcard,
      )

      choice.best_move
    end
  end
end