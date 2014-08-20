class RemoveQuanFromList < ActiveRecord::Migration
  def change
    remove_column :lists, :quan
  end
end
