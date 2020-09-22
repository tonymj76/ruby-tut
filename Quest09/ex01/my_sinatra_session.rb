require "sinatra"

require "sinatra/reloader" if development?

set :bind, '0.0.0.0'
set :port, 8080

enable :sessions

get '/' do
  "value = " << session[:value].inspect
  action, name, value = params[:action], params[:name], params[:value]
  case action
  when 'set'
    session[name] = value
  when 'get'
    session[name].inspect
  when 'del'
      session.delete(name)
  else
      "pass in the query params"
  end
end
