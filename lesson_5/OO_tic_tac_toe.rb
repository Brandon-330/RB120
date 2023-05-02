=begin

Tic tac toe is a game where a player plays against a computer. It is a turn based game. 
Each player starts with either an O mark, or an X mark
Both players must mark a part of the board until there are 3 marks in a row

Board
Square
Player
  - Mark
  - play
=end

class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @board = Board.new
  end

  def play
    display_welcome_message
    loop do
      clear_screen_and_display_board

      loop do
        human_moves
        break if board.full? || board.someone_won?

        computer_moves
        break if board.full? || board.someone_won?
       
        display_board
      end
      display_result
      break unless play_again?
      reset
    end

    display_goodbye_message
  end

  def reset
    board.reset
    clear
    puts "Let's play again!"
    puts ""
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
  end

  def display_goodbye_message
    puts "Thank you #{human.name} for playing Tic Tac Toe. Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
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

  def clear
    system 'clear'
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
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_result
    display_board
    case board.winning_marker
    when human.marker then puts "#{human.name} won!"
    when computer.marker then puts "Computer won!"
    else
      puts "The board is full!" if board.full?
    end
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
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

  def count_human_marker(squares)
    squares.map(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.map(&:marker).count(TTTGame::COMPUTER_MARKER)
  end

  def winning_marker
    WINNING_LINES.each do |line|
      if count_human_marker(@squares.values_at(*line)) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def someone_won?
    !!winning_marker
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
  attr_reader :marker, :name

  def initialize(marker)
    @name = get_name
    @marker = get_marker
  end

  def get_marker
    answer = nil

    puts "What is your marker?"
    loop do
      answer = gets.chomp
      break if ['X', 'O'].include?(answer.upcase)
      puts "Please enter an 'X' or 'O'"
    end

    answer
  end

  def get_name
    answer = nil

    loop do
      puts "What is your name?"
      answer = gets.chomp
      break if answer.is_a? String
      puts "Please enter your name"
    end

    answer
  end
end

game = TTTGame.new
game.play
