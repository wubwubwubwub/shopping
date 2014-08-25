class AddEmailToList < ActiveRecord::Migration
  def change
    add_column :lists, :email, :string
  end
end
