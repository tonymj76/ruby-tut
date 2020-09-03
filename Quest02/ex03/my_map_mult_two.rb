#returns an array mul by 2 using map function
def my_map_mult_two(arrays)
    return arrays.map{|array| array*2}
  end
  
  print my_map_mult_two((1..20).to_a), "\n"