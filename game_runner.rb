require_relative "game"
require_relative "win_result"
require_relative "player_strategy"

class GameRunner
  def initialize
    @game = Game.new
  end

  def run
    player = @game.player
    dealer = @game.dealer

    @game.deal_to_player
    @game.deal_to_dealer
    @game.deal_to_player

    queue = []
    queue << player.hands.first

    while !queue.empty?
      hand = queue.shift

      while !hand.bust?
        move = PlayerStrategy.next_move(hand, dealer.upcard)

        if move.split?
          queue << @game.split_hand(hand)
        elsif move.hit?
          @game.deal_to_player(hand: hand)
        elsif move.stay?
          break
        else
          raise StandardError, "Invalid move: #{move}"
        end

        if hand.bust? && hand.soft?
          hand.mark_as_hard!
        end
      end
    end

    # Dealer's turn if player isn't bust for all their hands
    unless player.bust?
      while dealer.can_hit?
        @game.deal_to_dealer

        if dealer.bust? && dealer.hand.soft?
          dealer.hand.mark_as_hard!
        end
      end
    end

    results = []

    player.hands.each do |hand|
      if hand.bust?
        results << WinResult.new(:dealer)
      elsif dealer.bust?
        results << WinResult.new(:player)
      elsif hand.total > dealer.hand.total
        results << WinResult.new(:player)
      elsif hand.total < dealer.hand.total
        results << WinResult.new(:dealer)
      else
        results << WinResult.new(:tie)
      end
    end

    @game.reset!

    results
  end
end