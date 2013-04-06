class Stream < ActiveRecord::Base
  attr_accessible :body, :item, :item_link, :picture, :stream_url, :title, :video, :name, :by_line, :site_root, :span, :link_root, :picture_root, :limit
end