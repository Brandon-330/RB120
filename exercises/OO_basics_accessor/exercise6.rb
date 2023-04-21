class Person
  attr_reader :name

  def name=(name)
    name = name.downcase
    @name = name[0].upcase + name[1..-1]
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name