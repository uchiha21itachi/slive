class Question < ApplicationRecord
  validates :question, presence: true
  belongs_to :user
  belongs_to :event
  has_many :answers
end
