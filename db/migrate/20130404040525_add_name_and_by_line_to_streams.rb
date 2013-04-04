class AddNameAndByLineToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :name, :string
    add_column :streams, :by_line, :string
  end
end
