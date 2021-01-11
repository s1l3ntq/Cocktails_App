class ChangeImageDataType < ActiveRecord::Migration
  def change
    change_column :cocktails, :image, :text
  end
end
