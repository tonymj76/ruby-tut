def my_sort(array, order)
  return [] if array.empty?
  case order
  when :asc
    return array.sort 
  when :desc
    return array.sort.reverse
  else
    return array 
  end
end

print my_sort([1, 2, 1], :desc)