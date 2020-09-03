def my_split(string, charset)
    return [] if string.strip.empty?
    return string.split(charset)
  end
  
  print my_split("abc def gh\t!", "def ")