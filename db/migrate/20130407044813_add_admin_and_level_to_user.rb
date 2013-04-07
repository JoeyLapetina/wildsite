class AddAdminAndLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :level, :string
  end
end
