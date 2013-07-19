class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :stream_id
      t.integer :user_id
      t.boolean :owner, :default => false

      t.timestamps
    end
  end
end
