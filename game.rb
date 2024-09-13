require_relative "card"
require_relative "deck"
require_relative "player"

class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new

    # TODO: Add multiple players
    @player = Player.new
    @dealer = Player.new(dealer: true)
  end

  def done?
    @player.bust? || !@dealer.can_hit?
  end

  def deal_to_player
    @player.hand.add_card(@deck.draw)
  end

  def deal_to_dealer
    @dealer.hand.add_card(@deck.draw)
  end

  def reset!
    @deck.add_back(@player.cards)
    @deck.add_back(@dealer.cards)

    @player.reset!
    @dealer.reset!

    @deck.shuffle!
  end

  def to_s
    "Player: #{player.hand.total} | Dealer: #{dealer.hand.total}"
  end
end