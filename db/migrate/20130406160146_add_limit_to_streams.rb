class AddLimitToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :limit, :integer
  end
end
