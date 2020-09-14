class WhatIsYourName
  attr_accessor :name # an easy where to add getter and setting to class object
  def speak 
    p "say something"
  end
end

dog = WhatIsYourName.new
dog.name = "bingo"
p dog.name
#attr_writer
#attr_reader