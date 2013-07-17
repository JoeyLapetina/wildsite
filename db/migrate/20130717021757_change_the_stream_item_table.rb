class ChangeTheStreamItemTable < ActiveRecord::Migration
  def up
	  remove_column :stream_items, :body
	  

	  add_column :stream_items, :body, :text
	  
	end

	def down
	  remove_column :stream_items, :body
	  

	  add_column :stream_items, :body, :string
	  
	end
end
