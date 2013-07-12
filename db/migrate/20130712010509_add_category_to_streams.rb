class AddCategoryToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :category, :string
  end
end
