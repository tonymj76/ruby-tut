class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year, @model, @color = year, model, color
    @counter = 0
  end

  def speed_up(num)
    @counter += num 
    p "lets speed up"
  end

  def brake_down(num)
    @counter -= num 
    p "lets slow down a bit"
  end

  def spray_paint(color) 
    p sprintf("change color from %s to %s", self.color, color)
    self.color = color
  end
  def stop_car
    @counter = 0
    p "lets pack this car up"
  end

end

ints = MyCar.new(2020, "R16", "Red")
p ints.color
ints.color = "blue"
p ints.color
p ints.year
ints.spray_paint("yellow")
p ints.color