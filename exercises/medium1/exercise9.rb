class Deck
  attr_reader :cards

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = restock
  end

  def restock
    deck = RANKS.each_with_object([]) do |rank, deck_array|
      SUITS.each do |suit|
        deck_array << Card.new(rank, suit)
      end
    end

    deck.shuffle!
  end

  def draw
    cards.pop
  end
end

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def convert_to_value(rank)
    case rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    else
      rank
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.