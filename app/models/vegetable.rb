require "tty-prompt"
require 'pry'

class Vegetable < ActiveRecord::Base
  has_many :recipes
  has_many :proteins, through: :recipes

  attr_accessor :veggie_choice

  def self.veggie_select
    prompt = TTY::Prompt.new

    # The promp list below is not numbered

    @veggie_choice = prompt.select("Please pick your Vegetable", %w(Carrots Broccoli Cauliflower Peas))
      until prompt.yes?("You selected #{@veggie_choice}, is this correct?") == true
        @veggie_choice = prompt.select("Really? Pick a vegetable!", %w(Carrots Broccoli Cauliflower Peas))
      end
      return @veggie_choice
  end

  def self.veggie_choice
    @veggie_choice
  end


end



