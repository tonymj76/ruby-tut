require "sinatra"
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'
set :port, 8080

get('/'){
  "Everybody can see this page"
  "#{request.url}"
}

get('/protected/:name/:password') { |name, password|
  if name == 'admin' and password =='admin'
    "Welcome, authenticated client"
  else
    "401 Not authorized."
  end
}
