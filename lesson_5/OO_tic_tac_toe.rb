=begin

Tic tac toe is a game where a player plays against a computer. It is a turn based game. Each player starts with either an O mark, or an X mark
Both players must mark a part of the board until there are 3 marks in a row

Board
Square
Player
  - Mark
  - play
=end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @board = Board.new
  end

  def play
    display_welcome_message
    display_board
    loop do
      human_moves
      break if board.full? # || someone_won?

      computer_moves
      display_board
      break if board.full? # || someone_won?
    end

    display_result
    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
  end

  def display_goodbye_message
    puts "Thank you for playing Tic Tac Toe. Goodbye!"
  end

  def display_board
    system 'clear'
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts ""
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry that is not a valid choice"
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    num = (1..9).to_a.sample
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_result
    display_board
    puts "The board is full!"
  end
end

class Board
  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new}
    # Set the grid board, possibly squares?
    # Introuce the game
    # Data structure
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker= INITIAL_MARKER)
    @marker = marker
    # Status of the square, whether it is marked or not
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

game = TTTGame.new
game.play