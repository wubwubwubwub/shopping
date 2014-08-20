class AddQuantityToItem < ActiveRecord::Migration
  def change
    add_column :items, :quan, :integer
  end
end
