require_relative '../config/environment'
require 'open-uri'
require 'net/http'
require 'pry'
prompt = TTY::Prompt.new


Header.header_logo
Menu.start

prot = Protein.protein_select.downcase
veg = Vegetable.veggie_select.downcase

puts "\nNice choice! Let's find some recipes containing #{prot} and #{veg}!\n"

puts Api.search_recipes(prot, veg)
until prompt.yes?("Does this recipe look good to you?") == true
    Api.search_recipes(prot, veg)
end

