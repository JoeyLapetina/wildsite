class AddSpanToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :span, :string
  end
end
