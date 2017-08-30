class Option < ApplicationRecord
	belongs_to :survey
	has_many :votes


  def as_json(options = {})
    {
      y: self.votes.count,
      legendText: self.choice,
      label: self.choice
    }.merge(options)
  end
end
