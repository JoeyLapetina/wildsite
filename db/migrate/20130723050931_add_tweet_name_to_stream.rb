class AddTweetNameToStream < ActiveRecord::Migration
  def change
    add_column :streams, :tweet_name, :string
  end
end
