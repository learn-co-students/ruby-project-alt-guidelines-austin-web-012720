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

  # def self.change_protein(prot, new_prot)
  #   protein = self.find_by(name: prot)
  #   protein.name = new_prot
  #   protein.save
  # end

def self.change
  prompt = TTY::Prompt.new
  protein_selection = prompt.select("Choose the protein you'd like to change", list_all_protein_names)
  protein_instance = self.find_by(name: protein_selection)
  protein_instance.name = prompt.ask("What would you like to change '#{protein_selection}' to?").capitalize
  if prompt.yes?("You want to change '#{protein_selection}' to '#{protein_instance.name}'\n Is this correct?") == true
    protein_instance.save
  end
end

def self.delete
  prompt = TTY::Prompt.new
  protein_selection = prompt.select("Choose the protein you'd like to delete", list_all_protein_names)
  protein_instance = self.find_by(name: protein_selection)
  if prompt.yes?("You want to delete '#{protein_selection}'\n Is this correct?") == true
    protein_instance.destroy
    binding.pry
  end
  return self.all
end

def self.add_new
  prompt = TTY::Prompt.new
  proteins = self.all.map {|protein| protein.name }
  new_protein = prompt.ask("What protein would you like to add?").capitalize
  if proteins.include?(new_protein)
    puts "That protein already exists"
  else
    protein = Protein.new(name: new_protein)
    if prompt.yes?("You've added '#{new_protein}' to the list\n Would you like to save?") == true
      protein.save
    end
  end
  return self.all
end

def self.list
  self.all.map {|protein| p protein.name}
end

def self.find(name)
  self.all.find_by(name: name)
end

end