require "tty-prompt"
require 'pry'

class Menu < ActiveRecord::Base
    attr_reader :menu_options, :add_options, :delete_options, :edit_options, :show_options

    @menu_options = ["Find Recipe", "Add Items", "Delete Items", "Edit Items", "Show Items", "Exit"]
    @add_options = ["Add Protein", "Add Vegetable", "<Back"]
    @delete_options = ["Delete Protein", "Delete Vegetable", "<Back"]
    @edit_options = ["Edit Protein", "Edit Vegetable", "<Back"]
    @show_options = ["Show Proteins", "Show Vegetables", "<Back"]

    def self.start
        prompt = TTY::Prompt.new
        
        response = prompt.select("What would you like to do today?", @menu_options)
        
        if response == "Find Recipe"
            prot = Protein.protein_select.downcase
            veg = Vegetable.veggie_select.downcase
            puts
            puts "Fuck yeah dude! Let's find some recipes containing #{prot} and #{veg}!"
            puts 
            puts
            until prompt.yes?("Does this recipe look good to you?") == true
                puts
                Api.search_recipes(prot, veg)
            end

            self.start
        elsif response == "Add Items"
            self.add_items
        elsif response == "Delete Items"
            self.delete_items
        elsif response == "Edit Items"
            self.edit_items
        elsif response == "Show Items"
            self.show_items 
        end

    end
    

    def self.add_items
        prompt = TTY::Prompt.new
        add_response = prompt.select("What would you like to add?", @add_options)
        if add_response == "Add Protein"
            Protein.add_new
            puts
            self.start
        else add_response == "Add Vegetable"
            Vegetable.add_new
            puts
            self.start
        end
    end

    def self.delete_items
        prompt = TTY::Prompt.new
        delete_response = prompt.select("What would you like to delete?", @delete_options)
        if delete_response == "Delete Protein"
            Protein.delete
        elsif delete_response == "Delete Vegetable"
            Vegetable.delete
        end
        puts
        self.start
    end

    def self.edit_items
        prompt = TTY::Prompt.new
        edit_response = prompt.select("What would you like to delete?", @edit_options)
        if edit_response == "Edit Protein"
            Protein.change
        elsif edit_response == "Edit Vegetable"
            Vegetable.change
        end
        puts
        self.start
    end
   
    def self.show_items
        prompt = TTY::Prompt.new
        show_response = prompt.select("What would you like to see?", @show_options)
        if show_response == "Show Proteins"
            Protein.list
        elsif show_response == "Show Vegetables"
            Vegetable.list
        end
        puts
        self.start
    end



end


