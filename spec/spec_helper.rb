require 'rspec'
require "friend"
require "animal"
require "pry"
require "PG"

DB = PG.connect({:dbname => 'animal_shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
    DB.exec("DELETE FROM friends *;")
  end
end
