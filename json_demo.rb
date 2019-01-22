require 'json'
require 'byebug'

def ask_for(attribute)
  puts "What's the #{attribute} of the beer?"

  gets.chomp.capitalize
end

# TODO - let's read/write data from beers.json
filepath = './data/beers.json'

serialized_beers = File.open(filepath).read
beers_hash = JSON.parse(serialized_beers)

# beers_hash["beers"] => Array
beers = beers_hash["beers"]

puts "Let's add a new beer!"

name = ask_for(:name)
appearance = ask_for(:appearance)
origin = ask_for(:origin)

beer = {
  "name" => name,
  "appearance" => appearance,
  "origin" => origin
}

beers << beer

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers_hash))
end







