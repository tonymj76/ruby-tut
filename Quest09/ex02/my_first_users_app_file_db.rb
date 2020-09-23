require "sinatra"
require 'json'
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'
set :port, 8080

before do
  content_type 'application/json'
end

enable :sessions

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
inst = User.new
users = inst.all()

def user_gen(hash)
  users = []
  hash.each_value { |value|
    users << {"lastname" => value["lastname"],
              "firstname" => value["firstname"],
              "age"=>value["age"],
              "email" => value["email"] }
  }
  return users
end

def user_info(hash, password, email)
  id = ""
  hash.each { |k, v|
    if email == v["email"] and password = v["password"]
      id = k
    end
  }
  return id
end

post("/users"){
  request.body.rewind
  request_payload = JSON.parse(request.body.read)
  inst.create(request_payload)
}
get("/users"){
  JSON.generate(user_gen(inst.all()))
}

post("/sign_in"){
  request.body.rewind
  request_payload = JSON.parse(request.body.read)
  email = request_payload["email"]
  password = request_payload["password"]
  if email != "" and password != ""
    session["auth"] = user_info(inst.all(), password, email)
  end
}

put("/users"){
  id = session["auth"].inspect
  request.body.rewind
  request_payload = JSON.parse(request.body.read)
  new_password = request_payload["password"]
  if new_password != "" {
    inst.update(id, "password", new_password)
    JSON.generate(inst.get(id))
  }
}

delete("/sign_out"){
  id = session["auth"].inspect
  if id != "" and id != nil
    session["auth"] = nil
    "thanks for signing out"
  end
}

delete("/users"){
  id = session["auth"].inspect
  if id != "" and id != nil
    inst.destroy(id)
    session["auth"] = nil
  end
}
