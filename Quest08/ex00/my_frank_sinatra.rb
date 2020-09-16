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
