class Vegetable < ActiveRecord::Base
    has_many :recipes
end