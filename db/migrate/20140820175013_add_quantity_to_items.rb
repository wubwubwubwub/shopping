class AddQuantityToItems < ActiveRecord::Migration
  def change
    add_column :items, :quan, :string
  end
end
