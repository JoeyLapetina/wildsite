class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :stream_url
      t.string :item
      t.string :title
      t.string :item_link
      t.string :body
      t.string :picture
      t.string :video

      t.timestamps
    end
  end
end
