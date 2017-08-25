class Event < ApplicationRecord

  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true, length: {minimum: 150}
  validates :address, presence: true
  validates :token, presence: true, uniqueness: true, length: {minimum: 6}

  has_many :questions
  has_many :livemessages
  has_many :surveys
  has_and_belongs_to_many :users



  belongs_to :presenter, class_name: User

end
