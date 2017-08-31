class Answer < ApplicationRecord
  validates :description, presence: true

  belongs_to :user
  belongs_to :question
end
