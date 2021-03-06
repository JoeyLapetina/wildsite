class Stream < ActiveRecord::Base
	is_impressionable
	
	require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

	has_many :favorites
  has_many :stream_items
  attr_accessible :body, :tweet_name, :track, :is_ready, :reverse_stream, :game, :use_more, :category, :stream_home_url, :active, :rank, :replies, :views, :item, :item_link, :picture, :stream_url, :title, :video, :name, :by_line, :site_root, :span, :link_root, :picture_root, :limit, :stream_type

  def items
  	items = StreamItem.where(stream_id: self.id.to_s)
  	items = items.sort! {|a, b| b.created_at <=> a.created_at }
  end

end