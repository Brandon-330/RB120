=begin

Rock paper scissors is a two player game where each
player chooses one of three possible moves: rock, paper, scissors.
The chosen will then be compared to see who winds
  - Rock beats scissors
  - Scissors beats paper
  - Paper beats rock

If players choose the same move, it is a tie

Nouns: player, move, rule
Verbs: choose, compare

Player
  - choose
Move
Rule

- Compare
=end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      display_goodbye_message
      break unless play_again?
    end
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_winner
    puts "You chose #{human.move}"
    puts "The computer chose #{computer.move}"
  
    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "You won!" if computer.move == 'scissors'
      puts "Computer won!" if computer.move == 'paper'
    when 'paper' 
      puts "It's a tie!" if computer.move == 'paper'
      puts "You won!" if computer.move == 'rock'
      puts "Computer won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "You won!" if computer.move == 'paper'
      puts "Computer won!" if computer.move == 'rock'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Must be y or n"
    end

    return true if answer == 'y'
    return false
  end
end

class Player
  attr_accessor :move

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "Invalid choice"
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class Move
  def initialize
  end
end

class Rule
  def initialize
  end
end

class Compare
end

RPSGame.new.play