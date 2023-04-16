module SmallHeight
  def smaller
    'The car is 4 feet tall'
  end
end

module BigHeight
  def bigger
    'The truck is 8 feet tall'
  end
end

class FordVehicle
  @@number_of_vehicles = 0

  def initialize
    @@number_of_vehicles += 1
  end

  def self.total_vehicles
    puts "The number of vehicles is #{@@number_of_vehicles}"
  end

  def self.make
    "Ford"
  end
end

class MyCar < FordVehicle
  attr_accessor :model, :year
  def initialize(model, year)
    @model = model
    @year = year
    @@number_of_vehicles += 1
  end

  include SmallHeight

  def number_of_doors
    4
  end
end

class MyTruck < FordVehicle
  attr_accessor :model, :year
  def initialize(model, year)
    @model = model
    @year = year
    @@number_of_vehicles += 1
  end

  include BigHeight

  def number_of_doors
    2
  end
end

car = MyCar.new('Focus', 2015)
truck = MyTruck.new('F-150', 2008)

puts car.number_of_doors
puts car.smaller
puts truck.bigger

puts MyCar.ancestors