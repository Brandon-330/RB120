class Person
  attr_accessor :name
  attr_reader :first, :last

  def name=(string)
    @first, @last = string.split
  end

  def name
    "#{first} #{last}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name