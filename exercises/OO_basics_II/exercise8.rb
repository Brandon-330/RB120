class Person
  attr_reader :secret
  
  def secret=(string)
    @secret = string
  end
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret