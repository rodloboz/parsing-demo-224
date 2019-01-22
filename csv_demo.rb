require 'csv'
require 'byebug'

def ask_for(attribute)
  puts "What's the #{attribute} of the beer?"

  gets.chomp.capitalize
end

# TODO - let's read/write data from beers.csv
filepath = './data/beers.csv'

beers = []

csv_options = {
  col_sep: ',',
  quote_char: '"',
  headers: :first_row,
  header_converters: :symbol
}

CSV.foreach(filepath, csv_options) do |row|
  # Without headers and header converter
  # row => Array
  # beer = {
  #   name: row[0],
  #   appearance: row[1],
  #   origin: row[2]
  # }

  # row => CSV::Row
  beer = {
    name: row[:name],
    appearance: row[:appearance],
    origin: row[:origin]
  }

  beers << beer
end

puts "Let's add a new beer!"

name = ask_for(:name)
appearance = ask_for(:appearance)
origin = ask_for(:origin)

beer = {
  name: name,
  appearance: appearance,
  origin: origin
}

beers << beer

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ["Name", "Appearance", "Origin"]

  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end


























