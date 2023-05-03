=begin
- Twenty one is a game where both players start with 2 cards Depending on the card
- Every card has its own value
- A player may hit or bust depending on getting 21
- Aces has a value of either 1 or 11

Nouns: Player, card, deck, dealer, game, bust?
Verbs: Hit, stay, deal
=end

class Game
  attr_reader :deck, :human, :dealer

  def initialize
    @deck = Deck.new
    @human = Player.new
    @dealer = Player.new
  end

  display_welcome_message
  show_initial_cards

  loop do
    player_turn
    dealer_turn
    break if player_turn.busted && dealer_turn.busted # Fix this
  end
  show_result

  def display_welcome_message
    puts "Welcome to Twenty One!"
  end

  def show_initial_cards
    @human.cards.each do |card|
      puts card
    end
  end

  def player_turn
    show_cards
    puts "Would you like to hit or stay?"
    loop do
      answer = gets.chomp
      break if ['hit', 'stay'].include?(answer.downcase)
      puts "Please enter 'hit' or 'stay'"
    end
end

class Player
  attr_accessor :cards, :busted, :stay

  def initialize
    @cards = []
    @busted = false
    @stay = true
    2.times { |_| hit }
  end

  def hit
    @cards << 
  end
end

class Card
  attr_reader :rank, :suit

  RANK = (1..10).to_a + %w(Jack Queen King Ace)
  SUIT = %w(Diamonds Clubs Spades Hearts)
  #VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' }
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
    reset
  end

  def deal
    #deal a card for the
  end

  def reset
    Card::SUIT.each do |suit|
      Card::RANK.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
  end
end