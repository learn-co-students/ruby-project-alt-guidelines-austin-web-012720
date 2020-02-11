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


end
