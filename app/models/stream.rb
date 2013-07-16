class Stream < ActiveRecord::Base
	has_many :items, :foreign_key => 'stream_id', :class_name => "StreamItem"
  attr_accessible :body, :track, :reverse_stream, :game, :use_more, :category, :stream_home_url, :active, :rank, :replies, :views, :item, :item_link, :picture, :stream_url, :title, :video, :name, :by_line, :site_root, :span, :link_root, :picture_root, :limit, :stream_type
end