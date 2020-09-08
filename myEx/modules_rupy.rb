module Speak
  def speak(*sound)
    puts "#{sound}"
  end
end

class Spanky
  include Speak
end

class Human
  include Speak
end

print "for Spanky \n"
puts Spanky.ancestors
puts ''
print "for Human \n"
puts Human.ancestors