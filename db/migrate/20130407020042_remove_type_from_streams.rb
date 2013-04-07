class RemoveTypeFromStreams < ActiveRecord::Migration
  def change
    remove_column :streams, :type
  end
end
