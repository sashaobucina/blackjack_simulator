class Deck
  def initialize(num_decks: 6)
    @cards = initialize_cards(num_decks)
  end

  def add_back(cards)
    cards.each { |card| @cards << card }
  end

  def draw
    @cards.pop
  end

  def peek
    @cards.last
  end

  def shuffle!
    @cards.shuffle!
  end

  private

  def initialize_cards(num)
    cards = []

    num.times do
      cards.concat([Card.new(2, "2")] * 4)
      cards.concat([Card.new(3, "3")] * 4)
      cards.concat([Card.new(4, "4")] * 4)
      cards.concat([Card.new(5, "5")] * 4)
      cards.concat([Card.new(6, "6")] * 4)
      cards.concat([Card.new(7, "7")] * 4)
      cards.concat([Card.new(8, "8")] * 4)
      cards.concat([Card.new(9, "9")] * 4)
      cards.concat([Card.new(10, "10")] * 4)
      cards.concat([Card.new(10, "J")] * 4)
      cards.concat([Card.new(10, "Q")] * 4)
      cards.concat([Card.new(10, "K")] * 4)
      cards.concat([Card.new(11, "A")] * 4)
    end

    cards.shuffle!
    cards
  end
end