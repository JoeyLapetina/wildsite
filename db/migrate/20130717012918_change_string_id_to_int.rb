class ChangeStringIdToInt < ActiveRecord::Migration
  def up
  	change_column :stream_items, :stream_id, :integer
  end

  def down
  	change_column :stream_items, :body, :string
  end
end
