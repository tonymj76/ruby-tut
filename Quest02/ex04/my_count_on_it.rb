#this generate different letters 
def generate_letters(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end
  
  #GENERATE arrays of random words
  def generate_arrays_str()
    return Array(10..20).map{|n| generate_letters(n)}
  end
  
  #coute the lenght of words 
  def my_count_on_it(str_array)
    return str_array.map{ |str| str.size}
  end
  
  print my_count_on_it(generate_arrays_str), "\n"