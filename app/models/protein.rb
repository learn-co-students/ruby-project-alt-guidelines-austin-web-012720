require "tty-prompt"
require 'pry'

class Protein < ActiveRecord::Base
  has_many :recipes
  has_many :vegetables, through: :recipes
  attr_accessor :protein_choice

  def self.list_all_protein_names
    Protein.all.map { |proteins| proteins.name}
  end 
  
  def self.protein_select
    prompt = TTY::Prompt.new
    @protein_choice = prompt.select("Please pick your Protein", list_all_protein_names)
      until prompt.yes?("You selected #{@protein_choice}, is this correct?") == true
        @protein_choice = prompt.select("Pick your protein carefully this time...", list_all_protein_names)
      end
    return @protein_choice 
  end

  def self.protein_choice
    @protein_choice
  end

end