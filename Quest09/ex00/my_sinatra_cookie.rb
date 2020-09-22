require "sinatra"
require 'json'
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'
set :port, 8080

get('/'){
  action, name, value = params[:action], params[:name], params[:value]
  case action
  when 'set'
    response.set_cookie(name, value) && "you need to passin name and value"
  when 'get'
    request.cookies[name]
  when 'del'
      response.delete_cookie(name) && "passing name to delete"
  else
      request.cookies
  end
}
