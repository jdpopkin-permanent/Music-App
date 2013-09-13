class AddStatusesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, null: false
    add_column :users, :active, :boolean, null: false
  end
end
