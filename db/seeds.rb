Protein.delete_all
Vegetable.delete_all
Recipe.delete_all

chicken = Protein.create(:name => "Chicken")
pork = Protein.create(:name => "Pork")
beef = Protein.create(:name => "Beef")
fish = Protein.create(:name => "Fish")

carrot = Vegetable.create(:name => "Carrot")
potato = Vegetable.create(:name => "Potato")
leak = Vegetable.create(:name => "Leak")
onion = Vegetable.create(:name => "Onion")