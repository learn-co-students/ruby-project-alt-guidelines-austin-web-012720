class Api < ActiveRecord::Base
    
    def self.search_recipes(protein, veggie)
        prot = protein
        veg = veggie
        #url = "https://api.spoonacular.com/recipes/random?number=1&tags=#{prot},#{veg}&apiKey=5f37997387b14e7d89c66a547ddcce3a"
        url = "https://api.spoonacular.com/recipes/random?number=1&tags=#{prot},#{veg}&apiKey=bb5ee8739db147798c44dc3dfb2a9968"

        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        recipe = response.body
        recipe_hash = JSON.parse(recipe)

        # method to format the instructions
        

        puts recipe_hash["recipes"][0]["title"]
        puts
        puts recipe_hash["recipes"][0]["instructions"]
        # text_clean_up(recipe_hash["recipes"][0]["instructions"])
        # recipe_hash["recipes"][0]["instructions"].text_clean_up
        puts

    end

    # def text_clean_up(text)
    #     # text = recipe_hash["recipes"][0]["instructions"]
    #     i = 1
    #     # no change needed
    #     puts "#{text}" if text.scan(/^.*/)

    #     # plain lump return
    #     if text.scan(/$/)
    #         while i < text.scan(/$/).count do
    #             puts "#{i}. #{text.split(/$/)[i]}"
    #             i += 1
    #         end 
    #     end 

    #     # ordered list lump
    #     if text.scan(/\d\./)
    #         while i < text.scan(/\d\./).count do
    #             puts "#{i}. #{text.split(/\d\./)[i]}"
    #             i += 1
    #         end
    #     end 

    #     # remove html tags
    #     if text.scan(/<ol>/)
    #     text_array = text.gsub(/<\/li>|<ol>|<\/ol>|<\/html>|<\/body>/,'').split(/<li>/)
    #         while i < text_array.length do
    #             puts "#{i}. #{text_array[i]}"
    #             i += 1
    #         end 
    #     end
    # end 
end
