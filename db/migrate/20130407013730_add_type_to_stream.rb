class AddTypeToStream < ActiveRecord::Migration
  def change
    add_column :streams, :type, :string, default: "stream"
  end
end
