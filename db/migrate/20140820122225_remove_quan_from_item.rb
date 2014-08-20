class RemoveQuanFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :quan
  end
end
