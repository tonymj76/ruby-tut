# loop tro an array with each function
def my_each(arrays)
    arrays.each{
      |array| puts array
    }
  end
  my_each((1..20).to_a)