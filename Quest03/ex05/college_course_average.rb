# get average score in a map
def class_average(dict)
    sum = dict.values.reduce(:+)
    return sprintf("%d", sum /dict.values.size)
  end
  class_csci101 = {
    "John" => 7,
    "Margot" => 8,
    "Jules" => 4,
    "Marco" => 19
    }
  puts "Average mark for the CSCI 101 class: #{class_average(class_csci101)}"