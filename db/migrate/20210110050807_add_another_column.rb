class AddAnotherColumn < ActiveRecord::Migration
  def change
    add_column :cocktails, :ingredient3, :string
    add_column :cocktails, :ingredient4, :string
    add_column :cocktails, :ingredient5, :string
    add_column :cocktails, :ingredient6, :string
  end
  
end
