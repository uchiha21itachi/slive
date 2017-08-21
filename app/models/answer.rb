class Answer < ApplicationRecord

  validates :description, presence: true
  validates :description, length: {minimum: 100}

  belongs_to :user
  belongs_to :question
end
