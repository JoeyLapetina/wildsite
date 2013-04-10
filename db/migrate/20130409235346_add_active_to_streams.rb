class AddActiveToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :active, :boolean
  end
end
