require 'json'
require 'open-uri'
require 'byebug'

# TODO - Let's fetch name and bio from a given GitHub username

BASE_URL = "https://api.github.com/users/"

puts "What's your Github username?"
username = gets.chomp

url = BASE_URL + username

serialized_user = open(url).read

user = JSON.parse(serialized_user)

if user["name"]
  first_name, last_name = user["name"].split
else
  first_name = username
end

public_repos = user["public_repos"]

puts "#{first_name} has #{public_repos} public repos."

