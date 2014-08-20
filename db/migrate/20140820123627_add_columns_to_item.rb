class AddColumnsToItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :list
      t.string :name
      t.string :notes
    
      t.timestamps
    end
  end
end
