#check the type of variable parameter
def my_isinteger(n)
    case n
    when Integer
        return 1
    else
        return 0
    end
  end
puts my_isinteger(6)