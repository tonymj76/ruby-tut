class MyCar
  attr_accessor :speed, :brake, :shot_down

  def initialize(year, color, model)
    @year, @color, @model = year, color, model
    @counter = 0
  end
  def speed_up(num)
    self.speed = num
    @counter += self.speed
  end
  def break_down (num)
    self.brake = num
    @counter -= self.brake
  end
  def car_off 
    self.shot_down =0
    @counter = self.shot_down
  end
  def state 
    @counter
  end
end

inst = MyCar.new(year=2020,color="red", model="R60" )
inst.speed_up(20)
inst.break_down(5)

p inst.state
inst.car_off
p inst.state

