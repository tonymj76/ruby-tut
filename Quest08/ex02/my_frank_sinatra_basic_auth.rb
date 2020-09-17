require "sinatra"
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'
set :port, 8080

# helpers do
#   def base_url
#     @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['REMOTE_USER']}#{request.env['HTTP_HOST']}"
#   end
# end

get('/'){
  "Everybody can see this page"
  # " jid #{request.env}"
}

# get('/protected') {
#   url = request.url
#   if name == 'admin' and password =='admin'
#     "Welcome, authenticated client"
#   else
#     "401 Not authorized."
#   end
# }
get('/protected/:name/:password') { |name, password|
  if name == 'admin' and password =='admin'
    "Welcome, authenticated client"
  else
    "401 Not authorized."
  end
}
