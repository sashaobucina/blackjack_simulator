class Deck
  def initialize(num_decks: 6)
    @num_decks = num_decks
    @cards = initialize_cards(num_decks)
  end

  def draw
    if @cards.empty?
      raise "Deck is empty"
    end

    @cards.pop
  end

  def peek
    if @cards.empty?
      raise "Deck is empty"
    end

    @cards.last
  end

  def shuffle!
    @cards.shuffle!
  end

  def reset!
    @cards = initialize_cards(@num_decks)
  end

  private

  def initialize_cards(num)
    cards = []

    num.times do
      [
        [2, '2'],
        [3, '3'],
        [4, '4'],
        [5, '5'],
        [6, '6'],
        [7, '7'],
        [8, '8'],
        [9, '9'],
        [10, '10'],
        [10, 'J'],
        [10, 'Q'],
        [10, 'K'],
        [11, 'A']
      ].each do |value, symbol|
        4.times { cards << Card.new(value, symbol) }
      end
    end

    cards.shuffle!
    cards
  end
end
