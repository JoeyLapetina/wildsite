class AddImageRootAndLinkRootToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :picture_root, :boolean
    add_column :streams, :link_root, :boolean
  end
end
