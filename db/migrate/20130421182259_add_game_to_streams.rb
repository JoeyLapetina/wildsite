class AddGameToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :game, :string
  end
end
