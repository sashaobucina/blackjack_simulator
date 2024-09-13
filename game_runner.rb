require_relative "game"
require_relative "win_result"
require_relative "player_strategy"

class GameRunner
  def initialize
    @game = Game.new
  end

  def run_once
    @game.deal_to_player
    @game.deal_to_dealer
    @game.deal_to_player

    while !@game.done?
      move = PlayerStrategy.next_move(@game)

      if move.stay?
        while @game.dealer.can_hit?
          @game.deal_to_dealer
        end
      elsif move.hit?
        @game.deal_to_player
      else
        raise StandardError, "Invalid move: #{move}"
      end
    end

    # Calculate who won
    result = if @game.player.bust?
      WinResult.new(:dealer)
    elsif @game.dealer.bust?
      WinResult.new(:player)
    elsif @game.player.hand.total > @game.dealer.hand.total
      WinResult.new(:player)
    elsif @game.player.hand.total < @game.dealer.hand.total
      WinResult.new(:dealer)
    else
      WinResult.new(:tie)
    end

    result
  end
end