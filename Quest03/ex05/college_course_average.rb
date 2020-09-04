# get average score in a map
# def class_average(dict)
#     sum = dict.values.reduce(:+)
#     return sprintf("%d", sum /dict.values.size)
#   end
# get average score in a map
def class_average(dict)
  return 0.0 if dict.empty?
  sum = dict.values.sum.to_f
  sum /dict.size
  end
  class_csci101 = {

}
  print "Average mark for the CSCI 101 class: #{class_average(class_csci101)}"