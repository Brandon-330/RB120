=begin
- Twenty one is a game where both players start with 2 cards Depending on the card
- Every card has its own value
- A player may hit or bust depending on getting 21
- Aces has a value of either 1 or 11

Nouns: Player, card, deck, dealer, game, bust?
Verbs: Hit, stay, deal
=end

class Game
  def initialize

  end

  display_welcome_message
  show_initial_cards

  loop do
    player_turn
    dealer_turn
    break if player_turn.busted? && dealer_turn.busted?
  end
  show_result

  def player_turn
    show_cards
    puts "Would you like to hit or stay?"
    loop do
      answer = gets.chomp
      
end

class Player
  def initialize
    @cards = []
    @busted? = false
    @stay = true
  end

  def hit
  end
end

class Card
  RANK = (1..9).to_a + %w(Jack, Queen, King, Ace)
  SUIT = %w(Diamonds, Clubs, Spades, Hearts)
  #VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' }
  def initialize(rank, suit)

  end
end

class Deck
  def initialize
    # Initialize whole deck of cards
  end

  def deal
    #deal a card for the
  end