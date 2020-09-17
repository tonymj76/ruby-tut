#get index of a string
def my_string_index(haystack, needle)
    num = haystack.index(needle)
    if num.to_i > 0 
        return num 
    end
    return -1
end

puts my_string_index("hello", "ll")