class CreateStreamItems < ActiveRecord::Migration
  def change
    create_table :stream_items do |t|
      t.text :body
      t.string :by_line
      t.string :item_link
      t.string :picture
      t.string :replies
      t.integer :stream_id
      t.string :title
      t.string :views

      t.timestamps
    end
  end
end
