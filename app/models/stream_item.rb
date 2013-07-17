class StreamItem < ActiveRecord::Base
	
  attr_accessible :body, :by_line, :item_link, :picture, :replies, :stream_id, :title, :views

  def stream
  	stream = Stream.find(self.stream_id.to_s)
  end
end
