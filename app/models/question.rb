class Question < ApplicationRecord

  validates :question, presence: true
  validates :category, presence: true, inclusion: { in: %w(question survey) }

  belongs_to :user
  belongs_to :event
  has_many :options, inverse_of: :question
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
end
