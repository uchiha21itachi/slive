class Survey < ApplicationRecord
	belongs_to :user
	belongs_to :event

	validates_presence_of :user, :event

   
    has_many :options, inverse_of: :survey
    accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
    has_many :votes

    
end
