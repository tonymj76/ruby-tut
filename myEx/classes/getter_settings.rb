class WhatIsYourName
  attr_accessor :name # an easy where to add getter and setting to class object
  def speak 
    "#{name} said something"
  end
end

dog = WhatIsYourName.new
dog.name = "bingo"
p dog.name
p dog.speak
#attr_writer
#attr_reader