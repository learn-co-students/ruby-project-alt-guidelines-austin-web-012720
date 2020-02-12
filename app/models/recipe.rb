class Recipe < ActiveRecord::Base
  belongs_to :vegetable
  belongs_to :protein

  # def self.add_new_recipe_to_table 
  #   Recipe.create(name: recipe_hash["recipes"][0]["title"], instructions: recipe_hash["recipes"][0]["instruction"])
  #   #new_recipe.name = recipe_hash["recipes"][0]["title"]
  #   #new_recipe.instructions = recipe_hash["recipes"][0]["instructions"]
  # end
        
end