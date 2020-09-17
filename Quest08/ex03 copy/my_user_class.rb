require "sinatra"
require "json"
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'
set :port, 8080

class User
  # attr_accessor :firstname, :lastname, :age, :password, :email

  def initialize
    @db = "db.raw"
    @user = Hash.new({})
  end

  def create(user_info)
    parsed_user = JSON.parse(user_info)
    @user.merge(user_info)
    backup()
  end

  def backup
    File.open(@db, "w") {|f| f.write @mapper}
  end
  def restore
    file = File.open(@db, "r")
    json = file.read
    file.close()
    return json
  end
end

get('/') {
  erb(:info)
}
post('/') {
  "#{params[:user]}"
}

__END__

@@ layout
<html>
  <head>
    <title>Super Simple Chat with Sinatra</title>
    <meta charset="utf-8" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  </head>
  <body><%= yield %></body>
</html>

@@ info
<form action='/' method="POST">
  <label for='firstname'>First Name:</label>
  <input name='firstname' value='' />
  <label for='lastname'>Last Name:</label>
  <input name='lastname' value='' />
  <label for='firstname'>First Name:</label>
  <input name='firstname' value='' />
  <label for='firstname'>First Name:</label>
  <input name='firstname' value='' />
  <label for='firstname'>First Name:</label>
  <input name='firstname' value='' />
  <input type='submit' value="GO!" />
</form>
