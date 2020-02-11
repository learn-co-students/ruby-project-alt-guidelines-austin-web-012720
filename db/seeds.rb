Protein.delete_all
Vegetable.delete_all
Recipe.delete_all

Protein.create(:name => "Chicken")
Protein.create(:name => "Pork")
Protein.create(:name => "Beef")
Protein.create(:name => "Fish")
Protein.create(:name => "Tofu")

Vegetable.create(:name => "Carrot")
Vegetable.create(:name => "Potato")
Vegetable.create(:name => "Leak")
Vegetable.create(:name => "Onion")
Vegetable.create(:name => "Corn")

# Recipe.create(:name => "recipe 1", :vegetable_id => 1, :protein_id => 1)
# Recipe.create(:name => "recipe 2", :vegetable_id => 2, :protein_id => 1)