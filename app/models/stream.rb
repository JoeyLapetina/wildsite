class Stream < ActiveRecord::Base
	require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

	has_many :favorites
  attr_accessible :body, :track, :is_ready, :reverse_stream, :game, :use_more, :category, :stream_home_url, :active, :rank, :replies, :views, :item, :item_link, :picture, :stream_url, :title, :video, :name, :by_line, :site_root, :span, :link_root, :picture_root, :limit, :stream_type

  def items
  	items = StreamItem.where(stream_id: self.id.to_s)
  	new_streams = items.select {|s| s.created_at > ('2013-07-19 22:36:07 -0500'.to_time)}
  	old_streams = items.select {|s| s.created_at < ('2013-07-19 22:36:07 -0500'.to_time)}
  	new_streams = new_streams.sort! {|a, b| b.created_at <=> a.created_at }
  	old_streams = old_streams.sort! {|a, b| a.created_at <=> b.created_at }
  	streams =  old_streams + new_streams
  	return streams
  end

end