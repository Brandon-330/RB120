
class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(n)
    self.speed += n
  end

  def brake(n)
    self.speed -= n
  end

  def turn_off
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
  end
end

Jaguar = MyCar.new('2015', 'white', 'F-Type')

Jaguar.spray_paint('blue')
p Jaguar.color
Jaguar.speed_up(60)
Jaguar.speed_up(60)
Jaguar.speed_up(60)
p Jaguar.speed

p Jaguar.turn_off

p Jaguar.speed
    