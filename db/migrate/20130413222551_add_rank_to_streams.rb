class AddRankToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :rank, :integer, default: 0
  end
end
