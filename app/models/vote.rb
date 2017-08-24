class Vote < ApplicationRecord
  belongs_to :survey
  belongs_to :option
  belongs_to :user
end
