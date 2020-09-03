def my_is_sort(array)
    return true if array.empty?
    sorted = array.sort
    desc = array.sort.reverse
    if array ===  sorted or array === desc
      return true
    end
    return false
  end
  
  print my_is_sort([])