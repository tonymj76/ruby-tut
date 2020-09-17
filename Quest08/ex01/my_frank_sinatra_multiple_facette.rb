require "sinatra"
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'
set :port, 8080

frank_sinatra = [
  'Ac-cent-tchu-ate the Positive',
  'Accidents Will Happen',
  'Adeste Fideles',
  'Ad-Lib Blues',
  'An Affair to Remember (Our Love Affair)',
  'After You have Gone',
  'Air For English Horn',
  'Alice Blue Gown',
  'All Alone',
  'All By Myself',
  'All I Do Is Dream of You',
  'All I Need is the Girl',
  'All My Tomorrows',
  'All of Me',
  'All of You',
  'All or Nothing at All',
  'All the Things You Are',
  'All the Way Home',
  'All Through the Day',
  'America the Beautiful',
]

get('/'){
  "#{frank_sinatra.sample}"
}

get("/birth_date"){
  "Francis Albert Sinatra was born on December 12, 1915"
}

get("/birth_city"){
 "Monroe Street in Hoboken, New Jersey"
}
get("/wifes") {
 "Ava Gardner, Mia Farrow, Barbara Marx "
}
get("/picture") {
 halt erb(:image)
}
__END__
@@ layout
<html>
  <head>
    <title> Simple Sinatra app</title>
    <meta charset="utf-8" />
  </head>
  <body><%= yield %></body>
</html>

@@ image 
<div> 
  <img src="https://upload.wikimedia.org/wikipedia/commons/a/af/Frank_Sinatra_%2757.jpg" /> 
<div>