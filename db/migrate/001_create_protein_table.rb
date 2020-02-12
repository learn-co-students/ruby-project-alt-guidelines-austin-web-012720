class CreateProteinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :proteins do |t|
      t.string :name
    end
  end
end
