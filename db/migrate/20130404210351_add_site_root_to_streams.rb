class AddSiteRootToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :site_root, :string
  end
end
