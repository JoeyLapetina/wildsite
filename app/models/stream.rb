class Stream < ActiveRecord::Base
  attr_accessible :body, :active, :replies, :views, :item, :item_link, :picture, :stream_url, :title, :video, :name, :by_line, :site_root, :span, :link_root, :picture_root, :limit, :stream_type
end