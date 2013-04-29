class AddStreamHomeUrlToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :stream_home_url, :string
  end
end
