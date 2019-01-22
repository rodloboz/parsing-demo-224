require 'open-uri'
require 'nokogiri'
require 'pry-byebug'

# Let's scrape recipes from http://www.epicurious.com
url = "https://www.worten.pt/informatica/computadores/computadores-mac?per_page=80&page=1"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

products = []
html_doc.search('.w-product').each do |element|
  product = {}

  product[:name] =  element.search('.w-product__title').text
  product[:description] = element.search('.w-product__description-excerpt').text
  product[:price] = element['data-price'].to_f

  products << product
end

p products.count



