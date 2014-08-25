class RemoveEmailFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :email
  end
end
