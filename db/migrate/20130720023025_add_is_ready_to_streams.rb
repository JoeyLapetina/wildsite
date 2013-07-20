class AddIsReadyToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :is_ready, :boolean, :default => false
  end
end
