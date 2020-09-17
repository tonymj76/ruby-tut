require "json"
class User
  def initialize
    @db = "db.raw"
    @user = Hash.new
  end

  def create(user_info)
    random_number = (rand * 100).floor()
    @user.update({random_number => user_info})
    backup()
    random_number
  end

  def get(user_id)
    restore()["#{user_id}"]
  end

  def all
    restore()
  end

  def update(user_id, attribute, value)
    users = restore()["#{user_id}"]
    users[attribute] = value
    users
  end

  def destory(user_id)
    restore().delete("#{user_id}")
  end
  def backup
    File.open(@db, "w") {|f| f.write JSON.generate(@user)}
  end
  def restore
    file = File.open(@db, "r")
    json = file.read
    file.close()
    return JSON.parse(json)
  end
end
users = [
  {"lastname" => "some name", "firstname" => "jay", "age" => 3, "password" => "password", "email" => "email@game.com"},
  {"lastname" => "Jone name", "firstname" => "tom", "age" => 66, "password" => "password", "email" => "yat@game.com"},
  {"lastname" => "kay name", "firstname" => "uk", "age" => 32, "password" => "password", "email" => "jdt@game.com"},
  {"lastname" => "goat name", "firstname" => "mado", "age" => 23, "password" => "password", "email" => "dkd@game.com"}
]
inst = User.new
ids = []
users.each { |user| ids << inst.create(user)}
puts "Gets a user"
p inst.get(ids.sample)
puts

puts "Fetches all users"
p inst.all

puts 

puts "Update a user a random users"
p inst.update(ids.sample, 'lastname', 'tony')

puts

puts "Destroyed a user"
inst.destory(ids.sample)

puts "lets comfirm"
p inst.all