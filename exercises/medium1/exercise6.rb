=begin
Guessing came involves guessing a number between 1 and 100 with a limit of 7 guesses
If the guess is too high/low, return that the guess is too high/low
If invalid guess, return invalid
=end

class GuessingGame
  attr_accessor :player

  def initialize
    @player = Player.new
    @number = (1..100).to_a.sample
  end

  def play
    loop do
      display
      break if player.guesses == 0
    end
  end

  def display
    puts "You have #{player.guesses} remaining."
    puts ""
    answer = nil
    loop do
      print "Enter a number between 1 and 100: "
      answer = gets.chomp
      break if valid_guess?(answer)
      puts "Invalid guess. "
    end

    evaluate_answer(answer)
  end

  def valid_guess?(answer)
    (1..100).cover?(answer)
  end

  def evaluate_answer(answer)
    if answer < number
      puts "Your guess is too low"
    elsif answer > number
      puts "Your guess is too high"
    else
      puts "That's the number!"
    end
  end
end

class Player
  attr_accessor :guesses

  def initialize
    @guesses = 7
  end
end

game = GuessingGame.new
game.play