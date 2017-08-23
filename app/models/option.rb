class Option < ApplicationRecord
	belongs_to :question 
	validates :question, presence: :true
end
