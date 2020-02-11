require_relative '../config/environment'
require 'open-uri'
require 'net/http'
require 'pry'


Header.header_logo

prot = Protein.protein_select.downcase
veg = Vegetable.veggie_select.downcase
puts
puts "Fuck yeah dude! Let's find some recipes containing #{prot} and #{veg}!"
puts 
Api.search_recipes(prot, veg)


# url = "https://api.spoonacular.com/recipes/random?number=1&tags=vegetarian,dessert&apiKey=5f37997387b14e7d89c66a547ddcce3a"
# url = "https://api.spoonacular.com/recipes/random?number=1&tags=#{prot},#{veg}&apiKey=5f37997387b14e7d89c66a547ddcce3a"
# uri = URI.parse(url)
# response = Net::HTTP.get_response(uri)
# recipe = response.body
# recipe_hash = JSON.parse(recipe)

# puts recipe_hash["recipes"][0]["title"]
# puts
# puts recipe_hash["recipes"][0]["instructions"]


