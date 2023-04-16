class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def name
    @name
  end

  def grade
    @grade
  end

  protected :grade

  def better_grade_than?(other_student)
    self.grade > other_student.grade
  end
end

joe = Student.new('joe', 70)
bob = Student.new('bob', 80)

puts joe.name
puts joe.better_grade_than?(bob)