class Person
  attr_writer :first_name, :last_name

  def first_equals_last?
    first_name == last_name
  end

  private
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?