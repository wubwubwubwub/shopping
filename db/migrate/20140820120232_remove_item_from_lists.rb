class RemoveItemFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :item
  end
end
