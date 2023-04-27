class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student # 3 lines
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student # 2 lines
end