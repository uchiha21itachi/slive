class Livemessage < ApplicationRecord

  validates :description, presence: true

  belongs_to :user
  belongs_to :event
end
