class Favorite < ActiveRecord::Base
	belongs_to :user
	belongs_to :stream
  attr_accessible :owner, :stream_id, :user_id
end
