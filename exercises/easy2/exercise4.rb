class Transform
  attr_reader :given_string

  def initialize(str)
    @given_string = str
  end

  def uppercase
    self.given_string.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')