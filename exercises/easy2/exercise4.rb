class Transform
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def uppercase
    word.upcase
  end

  def self.lowercase(letters)
    letters.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')