class AddStreamTypeToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :stream_type, :string, default: "stream"
  end
end
