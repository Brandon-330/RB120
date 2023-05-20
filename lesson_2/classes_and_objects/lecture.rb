class Person
  attr_reader :first_name
  attr_accessor :last_name

  def initialize(first_name)
    @first_name = first_name
    @last_name = ''
  end

  def name
    first_name + ' ' + last_name
  end

  def name=(full_name)
    parts = full_name.split(' ')
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def ==(other)
    self.name == other.name
  end

  def to_s
    name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts "The person's name is: #{bob}"

puts rob == bob