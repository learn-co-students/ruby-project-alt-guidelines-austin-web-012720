require "tty-prompt"
require 'pry'

class Vegetable < ActiveRecord::Base
  has_many :recipes
  has_many :proteins, through: :recipes

  attr_accessor :veggie_choice

  def self.list_all_vegetable_names
    Vegetable.all.map {|veg| veg.name}.uniq
  end
  
  def self.veggie_select
    prompt = TTY::Prompt.new

    # The promp list below is not numbered


    @veggie_choice = prompt.select("Please pick your Vegetable", list_all_vegetable_names)
      until prompt.yes?("You selected #{@veggie_choice}, is this correct?") == true
        @veggie_choice = prompt.select("Really? Pick a vegetable!", list_all_vegetable_names)
      end
      return @veggie_choice
  end

  def self.veggie_choice
    @veggie_choice
  end

  def self.change
    prompt = TTY::Prompt.new
    veggie_selection = prompt.select("Choose the vegetable you'd like to change", list_all_vegetable_names)
    veggie_instance = self.find_by(name: veggie_selection)
    veggie_instance.name = prompt.ask("What would you like to change '#{veggie_selection}' to?").capitalize
    if prompt.yes?("You want to change '#{veggie_selection}' to '#{veggie_instance.name}'\n Is this correct?") == true
      veggie_instance.save
    end
  end

  def self.delete
    prompt = TTY::Prompt.new
    veggie_selection = prompt.select("Choose the vegetable you'd like to delete", list_all_vegetable_names)
    veggie_instance = self.find_by(name: veggie_selection)
    if prompt.yes?("You want to delete '#{veggie_selection}'\n Is this correct?") == true
      veggie_instance.destroy
    end
    return self.all
  end
  
  def self.add_new
    prompt = TTY::Prompt.new
    veggies = self.all.map {|veggie| veggie.name }
    new_veggie = prompt.ask("What vegetable would you like to add?").capitalize
    if veggies.include?(new_veggie)
      puts "That vegetable already exists"
    else
      veggie = Vegetable.new(name: new_veggie)
      if prompt.yes?("You've added '#{new_veggie}' to the list\n Would you like to save?") == true
        veggie.save
      end
    end
    return self.all
  end

  def self.list
    self.all.map {|veggie| p veggie.name}
  end

  def self.find(name)
    self.all.find_by(name: name)
  end

end
