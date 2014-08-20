class AddAssociationToItems < ActiveRecord::Migration
  def change
    add_column :items, :list_id, :belongs_to
  end
end
