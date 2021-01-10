class CreateCocktails < ActiveRecord::Migration
  def change
    create_table :cocktails do |t|
      t.integer :drink_id
      t.string :name
      t.string :ingredient
      t.string :instruction
      t.string :image
    end
  end
end
