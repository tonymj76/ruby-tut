module Setter
  def set(key, value)
    return {key => value}
  end
end

class MyRedis
  def initialize()
    @mapper = Hash.new("nil") #just to show something 
  end
  include Setter
  def my_set(key, value)
    @mapper.update(set(key, value))
  end

  def my_get(key)
    @mapper[key]
  end

  def my_mset(*arg)
    arg.each{ |value|
      my_set(value[0], value[1])
    }
  end

  def my_mget(list)
    return [] if list.empty?
    key_values = []
    list.each{ |key|
      key_values << my_get(key)
    }
    key_values
  end
  def my_del(keys)
    return [] if keys.empty?
    keys.each{ |key|
      @mapper.delete(key)
    }
  end
  def my_exists(key)
    @mapper.has_key?(key)
  end
  def my_rename(key, new_key)
    return false if my_exists(new_key)
    return true unless my_exists(key)
    value = my_get(key)
    @mapper.delete(key)
    @mapper[new_key] = value
  end

  def backup
    File.open("my_dump.rdb", "w") {|f| f.write @mapper}
  end
  def restore
    file = File.open("my_dump.rdb", "r")
    json = file.read
    file.close()
    print json
  end
end

instan = MyRedis.new
instan.my_mset(['a', 3],['b', 8], [3, 'i'])
puts instan.my_get(3)
puts instan.my_get('b')
print instan.my_mget(['a', 'b', 3]), "\n"
print instan.my_mget([]), "\n"
instan.my_del(['a', 3])
puts instan.my_get('a')
puts instan.my_exists("b")
puts instan.my_exists('a')
instan.my_rename('b', 'z')
puts instan.my_exists('z')
instan.backup
instan.restore