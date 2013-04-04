class Stream < ActiveRecord::Base
  attr_accessible :body, :item, :item_link, :picture, :stream_url, :title, :video, :name, :by_line
end