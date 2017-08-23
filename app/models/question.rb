class Question < ApplicationRecord

  validates :question, presence: true
  validates :category, presence: true, inclusion: { in: %w(question survey) }

  belongs_to :user
  belongs_to :event
  end
