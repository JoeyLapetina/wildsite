class StreamItem < ActiveRecord::Base
	#belongs_to :stream
  attr_accessible :body, :by_line, :item_link, :picture, :replies, :stream_id, :title, :views
end
