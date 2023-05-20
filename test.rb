class Customer
  attr_reader :order

  def place_order
    @order = Order.new
  end
end

class Order

  def initialize
    @order = MealItem.new
  end

  def total
    total_cost = @burger + @side + @drink
    format("$%.2f", total_cost) # #format formats the cost to two decimal places
  end

  def to_s
    @order.meal.map(&:to_s).join(', ')
  end

  def +(other)
    self.cost + other.cost
  end
end

class MealItem
  def initialize
    @burger = Burger.new
    @side = Side.new
    @drink = Drink.new
  end
  
  def to_s
    self.class::OPTIONS[@option][:name]
  end

  def meal
    [@burger, @side, @drink]
  end

  def cost
    self.class::OPTIONS[@option][:cost]
  end

  def choose_option
    puts "Please choose a #{self.class} option:"
    puts item_options # item_options returns a list of options and prices
                      # for a particular item type
    gets.chomp
  end

  def item_options
    self.class::OPTIONS.each do |menu_number, inner_hash|
      inner_hash.each do |k, v|
        if k == :name
          print "#{menu_number}: A #{v} costs "
        else
          print "#{v}"
        end
      end
      puts ""
    end
    
    nil
  end
end

class Burger < MealItem
  OPTIONS = {
    '1' => { name: 'LS Burger', cost: 3.00 },
    '2' => { name: 'LS Cheeseburger', cost: 3.50 },
    '3' => { name: 'LS Chicken Burger', cost: 4.50 },
    '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
  }

  def initialize
    @option = choose_option
  end
end

class Side < MealItem
  OPTIONS = {
    '1' => { name: 'Fries', cost: 0.99 },
    '2' => { name: 'Onion Rings', cost: 1.50 }
  }

  def initialize
    @option = choose_option
  end
end

class Drink < MealItem
  OPTIONS = {
    '1' => { name: 'Cola', cost: 1.50 },
    '2' => { name: 'Lemonade', cost: 1.50 },
    '3' => { name: 'Vanilla Shake', cost: 2.00 },
    '4' => { name: 'Chocolate Shake', cost: 2.00 },
    '5' => { name: 'Strawberry Shake', cost: 2.00 }
  }

  def initialize
    @option = choose_option
  end
end

rick = Customer.new
rick.place_order
puts rick.order.total