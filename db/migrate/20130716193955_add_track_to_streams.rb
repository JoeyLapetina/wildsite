class AddTrackToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :track, :boolean, :default => false
  end
end
