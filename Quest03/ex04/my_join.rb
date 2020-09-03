def my_join(array, separator)
    return "" if array.empty?
    return [].append(array.join(separator))
  end
  
  print my_join([], "\t")