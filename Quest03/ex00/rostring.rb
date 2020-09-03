# 
def rostring(string)
    if string.strip.empty?
      return ""
    end
    h = string.match /(?<first>\w+) (?<rest>.*)/
    rests = h[:rest].split()
    return rests.append(h[:first]).join(' ')
  end
  
  print rostring(" AkjhZ zLKIJz , 23y"), "\n"
  