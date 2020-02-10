class Protein < ActiveRecord::Base
  has_many :recipes
  has_many :vegetables, through: :recipes
end