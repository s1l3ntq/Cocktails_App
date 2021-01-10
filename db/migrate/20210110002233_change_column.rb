class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :cocktails, :drink_id, :user_id

  end
end
