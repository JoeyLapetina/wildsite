class AddReverseToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :reverse_stream, :boolean, default: false
  end
end
