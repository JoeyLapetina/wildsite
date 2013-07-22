class CreateScrapebots < ActiveRecord::Migration
  def change
    create_table :scrapebots do |t|
      t.string :name
      t.text :bio
      t.string :game
      t.integer :stream_count
      t.integer :stream_item_count

      t.timestamps
    end
  end
end
