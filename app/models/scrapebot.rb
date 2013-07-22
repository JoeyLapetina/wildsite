class Scrapebot < ActiveRecord::Base
  attr_accessible :bio, :game, :name, :stream_count, :stream_item_count
end
