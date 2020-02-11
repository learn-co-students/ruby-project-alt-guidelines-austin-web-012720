class Vegetable < ActiveRecord::Base
  has_many :recipes
  has_many :proteins, through: :recipes

  
end