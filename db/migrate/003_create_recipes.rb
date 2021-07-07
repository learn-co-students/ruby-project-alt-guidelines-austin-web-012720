class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :vegetable_id
      t.integer :protein_id
    end
  end
end
