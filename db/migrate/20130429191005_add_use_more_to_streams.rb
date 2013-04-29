class AddUseMoreToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :use_more, :boolean, :default => true
  end
end
