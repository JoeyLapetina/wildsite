class ChangeTheStreamItemTable < ActiveRecord::Migration
  def change
	  remove_column :stream_items, :body
	  remove_column :stream_items, :string_id

	  add_column :stream_items, :body, :text
	  add_column :stream_items, :string_id, :integer
	end
end
