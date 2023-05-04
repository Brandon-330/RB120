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

  def start
    display_welcome_message
    @human.hand << deck.deal << deck.deal
    @dealer.hand << deck.deal << deck.deal

    loop do
      player_turn
      dealer_turn
      break if @human.busted || !@human.hit
    end
    show_result
  end

  def display_welcome_message
    puts "Welcome to Twenty One!"
  end

  def show_cards
    clear
    puts "You have the following cards in hand:"
    @human.hand.each do |card|
      puts card
    end
    puts ""
  end

  def player_turn
    show_cards
    puts "Would you like to hit or stay?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['hit', 'stay'].include?(answer)
      puts "Please enter 'hit' or 'stay'"
    end

    @human.hit = (answer == 'hit' ? true : false)
    @human.hand << @deck.deal if @human.hit
    @human.busted = true if total(@human)
  end

  def dealer_turn
    loop do
      sum = total(@dealer)

      @dealer.hit = (sum < 17 ? true : false)
      @dealer.busted = true if sum > 21
      break if !@dealer.hit || @dealer.busted
      @dealer.hand << @deck.deal
    end
  end

  def total(player)
    total = player.hand.inject(0) do |sum, card| 
      sum + card.value
    end
  end

  def clear
    system 'clear'
  end
end

class Player
  attr_accessor :hand, :busted, :hit

  def initialize
    @hand = []
    @busted = false
    @hit = false
  end
end

class Card
  attr_reader :rank, :suit

  RANK = (1..10).to_a + %w(Jack Queen King Ace)
  SUIT = %w(Diamonds Clubs Spades Hearts)
  VALUES = { 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 11 }
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    if rank.is_a? Integer
      rank
    else
      VALUES[rank]
    end
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    reset
  end

  def deal
    @cards.pop
  end

  def reset
    Card::SUIT.each do |suit|
      Card::RANK.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end

    @cards.shuffle!
  end
end


Game.new.start