class Protein < ActiveRecord::Base
    has_many :recipes 
end