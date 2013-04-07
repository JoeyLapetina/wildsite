class AddRepliesAndViewsToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :replies, :string
    add_column :streams, :views, :string
  end
end
