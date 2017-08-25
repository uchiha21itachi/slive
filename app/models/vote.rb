class Vote < ApplicationRecord
  belongs_to :survey
  belongs_to :option
  belongs_to :user
  validates :survey, uniqueness: { 
  	scope: [:user_id, :option_id], 
  	message: "You already voted for this Option" }
end
