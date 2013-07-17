class Stream < ActiveRecord::Base
	
  attr_accessible :body, :track, :reverse_stream, :game, :use_more, :category, :stream_home_url, :active, :rank, :replies, :views, :item, :item_link, :picture, :stream_url, :title, :video, :name, :by_line, :site_root, :span, :link_root, :picture_root, :limit, :stream_type

  def items
  	items = StreamItem.where(stream_id: self.id.to_s)
  end

end