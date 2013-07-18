class AddHideStreamItemToStreamItems < ActiveRecord::Migration
  def change
    add_column :stream_items, :hide_stream_item, :boolean, :default => false
  end
end
