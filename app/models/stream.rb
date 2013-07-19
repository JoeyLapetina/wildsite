class Stream < ActiveRecord::Base
	has_many :favorites
  attr_accessible :body, :track, :reverse_stream, :game, :use_more, :category, :stream_home_url, :active, :rank, :replies, :views, :item, :item_link, :picture, :stream_url, :title, :video, :name, :by_line, :site_root, :span, :link_root, :picture_root, :limit, :stream_type

  def items
  	items = StreamItem.where(stream_id: self.id.to_s)
  	ordered_items = items.all.sort! {|a, b| a.created_at <=> b.created_at }
  	unless ordered_items.nil?
	  	new_streams = ordered_items.select {|s| s.hide_stream_item == false }
	  	unless new_streams.nil?
		  	ordered_items = ordered_items - new_streams
		  	new_streams = new_streams.reverse
		  	done = new_streams + ordered_items
		  	return done
		  else
		  	return ordered_items
		  end
		end
  end

 

end