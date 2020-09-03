#check the type of variable parameter
def my_isstring(n)
    case n
    when String
        return 1
    else
        return 0
    end
  end
puts my_isstring(6)