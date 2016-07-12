require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/animal")
require("./lib/friend")

get('/') do
  erb(:index)
end

get('/admin') do
  erb(:admin)
end

get('/admin/animals/new') do
  erb(:animal_form)
end
