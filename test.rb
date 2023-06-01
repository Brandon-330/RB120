module Flyable
  def fly
    puts "I can fly!"
  end
end

module Sociable
  def social
    puts "I talk... ALOT"
  end
end

class Animal
  @@total = 0

  def initialize
    @@total += 1
    @animal_id = @@total
    @body_temperature = "warm-blooded"
  end

  def to_s
    <<-block
=========================
species: #{self.class}
animal id: #{animal_id}
weight: #{weight}
diet: #{diet}
body temp: #{body_temperature}
=========================
    block
  end

  protected

  attr_reader :animal_id, :weight, :diet, :body_temperature

  protected 

  def calc_weight(min_weight, max_weight)
    (min_weight..max_weight).to_a.sample
  end
end

class Herbivore < Animal
  def initialize
    @diet = 'vegetation'
    super
  end
end

class Carnivore < Animal
  def initialize
    @diet = 'meat'
    super
  end

  def hunt(prey)
    puts "I ate a #{prey} for dinner. Yum!"
  end
end

class Zebra < Herbivore
  include Sociable

  def initialize
    @weight = calc_weight(770, 990)
    super
  end
end

class Hawk < Carnivore
  include Flyable

  def initialize
    @weight = calc_weight(12, 15)
    super
  end
end

class Tiger < Carnivore
  def initialize
    @weight = calc_weight(200, 680)
    super
  end
end

class Koala < Herbivore
  def initialize
    @weight = calc_weight(10, 30)
    super
  end
end

class Parrot < Herbivore
  include Flyable
  include Sociable

  def initialize
    @weight = calc_weight(1, 3)
    super
  end
end

puts Zebra.new
puts Tiger.new
puts Parrot.new
