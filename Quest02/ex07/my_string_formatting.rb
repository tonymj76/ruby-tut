#type formatting
def my_string_formatting(firstname, lastname, age)
    return sprintf("%s %s %d", firstname, lastname, age)
end

puts my_string_formatting("dkdk", "dkd", 55)

# #type formatting
# def my_string_formatting(firstname, lastname, age)
#     message = "#{firstname} #{lastname} #{age * 2}"
#     return message
# end

# puts my_string_formatting("dkdk", "dkd", 55)