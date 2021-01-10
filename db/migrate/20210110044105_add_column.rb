class AddColumn < ActiveRecord::Migration
  def change
    add_column :cocktails, :ingredient2, :string
  end
end
