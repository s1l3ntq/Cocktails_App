class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :cocktails, :ingredient, :ingredient1
  end
end
