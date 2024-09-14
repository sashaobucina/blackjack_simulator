require_relative "card"
require_relative "deck"
require_relative "player"
require_relative "dealer"

class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new

    @player = Player.new
    @dealer = Dealer.new
  end

  def done?
    @player.bust? || !@dealer.can_hit?
  end

  def deal_to_player(hand: nil)
    hand = hand || @player.hands.first
    hand.add_card(@deck.draw)
  end

  def deal_to_dealer
    @dealer.hand.add_card(@deck.draw)
  end

  def split_hand(hand)
    if hand.cards.size != 2
      raise "Cannot split hand with #{hand.cards.size} card(s)"
    end

    card1, card2 = hand.cards

    hand.discard_cards!
    hand.add_card(card1)

    new_hand = Hand.new(cards: [card2])
    @player.add_hand(new_hand)

    new_hand
  end

  def reset!
    @deck.reset!

    @player.reset!
    @dealer.reset!
  end

  def to_s
    "Player: #{player.hand.total} | Dealer: #{dealer.hand.total}"
  end
end