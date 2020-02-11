require "tty-prompt"
require 'pry'

class Protein < ActiveRecord::Base
  has_many :recipes
  has_many :vegetables, through: :recipes
  attr_accessor :protein_choice

  
  def self.protein_select
    prompt = TTY::Prompt.new
    @protein_choice = prompt.select("Please pick your Protein", %w(Chicken Beef Pork Tofu)
      until prompt.yes?("You selected #{@protein_choice}, is this correct?") == true
        @protein_choice = prompt.select("Pick your protein carefully this time...", %w(Chicken Beef Pork Tofu))
      end
    return @protein_choice 
  end

  def self.protein_choice
    @protein_choice
  end

end