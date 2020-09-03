# get average score in a map
def my_average_mark(dict)
    sum = dict.values.reduce(:+)
    return sprintf("%d.$", sum/dict.values.size)
  end
  class_csci101 = {
  "margot" => 17,
  "june" => 8,
  "colin" => 14,
  "lewis" => 9 }
  puts "Average mark for the CSCI 101 class: #{my_average_mark(class_csci101)}."