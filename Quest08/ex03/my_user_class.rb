require "json"
class User
  def initialize
    @db = "db.raw"
    @user = Hash.new
    @random_number = 0
  end

  def create(user_info)
    @random_number += 1
    @user.update({@random_number => user_info})
    backup()
    @random_number
  end

  def get(user_id)
    puts " with id #{user_id}"
    restore()["#{user_id}"]
  end

  def all
    restore()
  end

  def update(user_id, attribute, value)
    puts " with id #{user_id}, attribute of #{attribute} and value of #{value}"
    allusers = restore()
    users = allusers["#{user_id}"]
    users[attribute] = value
    @user = allusers
    backup()
    return users
  end

  def destroy(user_id)
    allusers = restore()
    u = allusers.delete("#{user_id}")
    @user = allusers
    puts " with id #{user_id}"
    backup()
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
print "Gets a user"
p inst.get(ids.sample)
puts
puts "Fetches all users"
p inst.all

puts 

print "Update a random users"
p inst.update(ids.sample, 'lastname', 'tony')

puts

print "Destroyed a user"
inst.destroy(ids.sample)
puts
print "\t\t ----lets comfirm----\n"
p inst.all