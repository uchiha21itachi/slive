class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :token, presence: true, uniqueness: true, length: {minimum: 6}

  has_many :questions
  has_many :livemessages
  has_many :surveys
  has_one :presentation
  has_and_belongs_to_many :users

  belongs_to :presenter, class_name: User

  def start_at

    e = Time.new(date.year, date.month, date.day, time.hour, time.min)
    date = e.strftime("%d") + "-" + e.strftime("%B") + "-" +  e.strftime("%Y")
    time = e.strftime("%H") + ":" + e.strftime("%M")
    e = date + " " + time
    return e
  end


end
