class CreateStreamItems < ActiveRecord::Migration
  def change
    create_table :stream_items do |t|
      t.string :body
      t.string :by_line
      t.string :item_link
      t.string :picture
      t.string :replies
      t.string :stream_id
      t.string :title
      t.string :views

      t.timestamps
    end
  end
end
