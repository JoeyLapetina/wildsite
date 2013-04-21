class Submission < ActiveRecord::Base
	validates :submission_url, :presence => true
	
  attr_accessible :submission_description, :submission_type, :submission_url, :submitter_email, :submitter_name
end
