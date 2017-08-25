class Option < ApplicationRecord
	belongs_to :survey
	has_many :votes
	
end
