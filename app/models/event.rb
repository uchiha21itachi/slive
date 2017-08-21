class Event < ApplicationRecord

  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true, length: {minimum: 150}
  validates :address, presence: true

  has_many :questions
  has_many :livemessages
end
