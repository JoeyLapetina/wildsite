class ChangeBodyToText < ActiveRecord::Migration
  def up
  	change_column :stream_items, :body, :text
  end

  def down
  	change_column :stream_items, :body, :string
  end
end
